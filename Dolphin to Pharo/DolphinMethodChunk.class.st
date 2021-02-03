Class {
	#name : #DolphinMethodChunk,
	#superclass : #MethodChunk,
	#category : #'Dolphin to Pharo'
}

{ #category : #importing }
DolphinMethodChunk >> importFor: requestor logSource: aBoolean [

	| packages |

	self sanitizeDolphinCode.
	super importFor: requestor logSource: aBoolean.
	
	packages := self packages.
	packages size > 1 ifTrue: 
		[((packages detect: [  :each | each includesClassNamed: self behaviorName ]) definedSelectorsForClass: self targetClass) remove: self methodSelector]
]

{ #category : #importing }
DolphinMethodChunk >> packages [
	| method originSelector |
	"This method returns the package this method belongs to.  
	It takes into account classes and traits.  
	If the method is in no package, returns nil by now"
	method := self targetClass>>self methodSelector.
	originSelector := method originMethod selector.
	
	^method origin packages 
		select: [ :each | 
			method origin isMeta
				ifFalse: [ each includesSelector: originSelector ofClassName: method origin instanceSide originalName]
				ifTrue: [ each includesSelector: originSelector ofMetaclassName: method origin instanceSide originalName]] 
]

{ #category : #importing }
DolphinMethodChunk >> sanitizeDolphinCode [

	"Remove line feed characters and double-hashes (##) - the latter turns static expressions into normal code"

	| readStream writeStream |

	readStream  := contents readStream.
	writeStream := (contents class new: contents size) writeStream.
	
	[ readStream atEnd ] whileFalse: 
		[| next |
		[next := readStream next.
		next = Character lf] whileTrue.
		(next = $# and: [ readStream peek = $# ]) ifTrue: [ readStream next. next := readStream next ].
		next isNil ifFalse: [ writeStream nextPut: next ]].

	contents := writeStream contents
]

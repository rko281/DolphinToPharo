Class {
	#name : #DolphinChunkFileFormatParser,
	#superclass : #ChunkFileFormatParser,
	#category : #'Dolphin Packages'
}

{ #category : #initialization }
DolphinChunkFileFormatParser >> defaultMethodsForSelector [
	^ #methodsFor
]

{ #category : #'class factory' }
DolphinChunkFileFormatParser >> methodChunkClass [
	^ DolphinMethodChunk
]

{ #category : #initialization }
DolphinChunkFileFormatParser >> parseDolphinCategorization: methodsPreamble [
	| behaviorName isMeta selector categories category |
	behaviorName := methodsPreamble first.
	isMeta := methodsPreamble second = self classSelector
		or: [ methodsPreamble second = self classTraitSelector ].
	selector := methodsPreamble last.

	categories := OrderedCollection new.

	[ 
	category := readStream next trimBoth .
	category notEmpty ]
		whileTrue:
			[ categories add: category ].
		
	categories isEmpty ifTrue: [ ^self ].
	
	category := categories detect: [  :each | (#('public' 'private') includes: each) not ] ifNone: [ categories first ].

	self addDeclaration: (DolphinMethodCategoryChunk new behaviorName: behaviorName; isMeta: isMeta; selector: selector; category: category; yourself)
]

{ #category : #initialization }
DolphinChunkFileFormatParser >> parseDolphinClassCategorization: methodsPreamble [

	[ readStream next trimBoth isEmpty] whileFalse
]

{ #category : #initialization }
DolphinChunkFileFormatParser >> parseMethodDeclarations: methodsPreamble [
	| behaviorName isMeta category stamp methodSource |
	"The method preable is an array with the following structure:
	If instance side method:
	
	#(#CodeImportTestCaseTestClass #methodsFor: 'some protocol' #stamp: 'GuillermoPolito 5/2/2012 13:35')
	
	if class side:
	
	#(#CodeImportTestCaseTestClass #class #methodsFor: 'some protocol' #stamp: 'GuillermoPolito 5/2/2012 13:35')
	
	Sometimes there is no timestamp:
	
	#(#CodeImportTestCaseTestClass #methodsFor: 'some protocol')
	
	"
	behaviorName := methodsPreamble first.
	isMeta := methodsPreamble second = self classSelector
		or: [ methodsPreamble second = self classTraitSelector ].
	category := ''.
	stamp := ''.
	[ 
	methodSource := readStream next.
	methodSource notEmpty ]
		whileTrue:
			[ 
			self
				addDeclaration:
					(self methodChunkClass
						contents: methodSource
						behaviorName: behaviorName asSymbol
						isMeta: isMeta
						category: category
						stamp: stamp) ]
]

{ #category : #initialization }
DolphinChunkFileFormatParser >> parseNextDeclaration [
	| isMetadata nextChunk |
	readStream skipSeparators.
	readStream isNextStyleChunk
		ifTrue:
			[ 
			self addDeclaration: (self styleChunkClass contents: readStream readUpToEndOfStyleChunk).
			^ self ].
	isMetadata := readStream isNextChunkMetaData.
	nextChunk := readStream next.
	isMetadata
		ifFalse: [ self addDeclaration: (self doItChunkClass contents: nextChunk) ]
		ifTrue:
			[ 
			| substrings |
			substrings := nextChunk parseLiterals.
			(substrings includes: self methodsForSelector asString)
				ifTrue: [ ^ self parseMethodDeclarations: substrings ].
			(substrings includes: self commentStampSelector asString)
				ifTrue: [ ^ self parseCommentDeclaration: substrings ].
			(substrings includes: self reorganizeSelector asString)
				ifTrue: [ ^ self parseClassOrganization: substrings ] .
			(substrings includes: 'categoriesFor:') ifTrue: [ ^self parseDolphinCategorization: substrings ].
			(substrings includes: 'categoriesForClass') ifTrue: [ ^self parseDolphinClassCategorization: substrings ]  ]
]

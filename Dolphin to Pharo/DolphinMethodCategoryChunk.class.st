"
CompiledMethod allInstances select: [ :each | each isInstalled and: [(each package ifNil: [false] ifNotNil: [ :p | p name beginsWith: 'SSW']) and: [each sourceCode includes: Character lf]]].
"
Class {
	#name : #DolphinMethodCategoryChunk,
	#superclass : #BehaviorOwnedChunk,
	#instVars : [
		'selector',
		'category'
	],
	#category : #'Dolphin to Pharo'
}

{ #category : #accessing }
DolphinMethodCategoryChunk >> category [
	^ category
]

{ #category : #accessing }
DolphinMethodCategoryChunk >> category: anObject [
	category := anObject
]

{ #category : #importing }
DolphinMethodCategoryChunk >> importFor: requestor logSource: aBoolean [

	self existsBehavior ifFalse: [ ^self ].
	
	SystemAnnouncer uniqueInstance suspendAllWhile: [ 
		self targetClass organization 
			classify: self selector 
			under: self category ]
]

{ #category : #accessing }
DolphinMethodCategoryChunk >> selector [
	^selector
]

{ #category : #accessing }
DolphinMethodCategoryChunk >> selector: anObject [
	selector := anObject
]

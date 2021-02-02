Class {
	#name : #PoolDictionary,
	#superclass : #Dictionary,
	#instVars : [
		'name',
		'pool'
	],
	#category : #'Dolphin to Pharo'
}

{ #category : #'instance creation' }
PoolDictionary class >> named: aSymbol [

	^self new
		name: aSymbol;
		yourself
]

{ #category : #accessing }
PoolDictionary >> classVarsString [

	| stream |
	
	stream := WriteStream on: (String new: self size * 8).
	
	self keysDo: [ :each | stream nextPutAll: each; space ].
	
	^stream contents
]

{ #category : #'instance creation' }
PoolDictionary >> compilePoolInitializationMethod: aString [

	| selector |
	selector := pool class compile: aString.
	(pool class>>selector) protocol: 'pool initialization'
]

{ #category : #'instance creation' }
PoolDictionary >> declareInitializerFor: aKey [

	| stream |

	stream := WriteStream on: (String new: 64).
	
	stream 
		nextPutAll: 'initialize_'; nextPutAll: aKey; cr;
		tab; nextPutAll: aKey; nextPutAll: ' := '; print: (self at: aKey).

	self compilePoolInitializationMethod: stream contents
]

{ #category : #'instance creation' }
PoolDictionary >> declarePoolInitializer [

	| stream selCount initCount |
	
	stream := WriteStream on: (String new: 64).
	stream cr; tab; nextPutAll: 'self'.

	"Need to respect the 255 literal limit"
	initCount := 0.
	selCount := 0.
	
	self keys asSortedCollection do: 
		[ :each | 
		stream cr; tab; tab; nextPutAll: 'initialize_'; nextPutAll: each; nextPut: $;.
		selCount := selCount + 1.
		selCount > 250 ifTrue: 
			[stream cr; tab; tab; nextPutAll: 'yourself'.
			selCount := 0.
			initCount := initCount + 1.
			self compilePoolInitializationMethod: ('initialize', initCount printString, stream contents).
			stream := WriteStream on: (String new: 64).
			stream cr; tab; nextPutAll: 'self'; cr; tab; tab; nextPutAll: 'initialize'; print: initCount; nextPut: $;]].

	stream cr; tab; tab; nextPutAll: 'yourself'.
	self compilePoolInitializationMethod: ('initialize', stream contents)
]

{ #category : #testing }
PoolDictionary >> isManifest [

	^false
]

{ #category : #accessing }
PoolDictionary >> name [
	^ name
]

{ #category : #accessing }
PoolDictionary >> name: aSymbol [
	pool := self class environment at: aSymbol.
	name := aSymbol
]

{ #category : #'instance creation' }
PoolDictionary >> shrink [ 

	"Sent at end of pool declaration. Create the SharedPool class"

	self class environment at: self name put: pool.
	RPackage currentDolphinPackage classNames add: self name.

	SharedPool 
		subclass: self name
		instanceVariableNames: ''
		classVariableNames: self classVarsString
		package: RPackage currentDolphinPackage name.	
	
	self keysDo: [ :each | self declareInitializerFor: each ].
	self declarePoolInitializer.
	pool initialize
]

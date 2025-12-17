Class {
	#name : 'DolphinCodeImporter',
	#superclass : 'CodeImporter',
	#instVars : [
		'toInstall'
	],
	#classInstVars : [
		'current'
	],
	#category : 'Dolphin to Pharo',
	#package : 'Dolphin to Pharo'
}

{ #category : 'accessing' }
DolphinCodeImporter class >> current [

	^ current
]

{ #category : 'accessing' }
DolphinCodeImporter class >> current: anObject [

	current := anObject
]

{ #category : 'adding' }
DolphinCodeImporter >> addToInstall: aDolphinPackageCollection [

	^toInstall add: aDolphinPackageCollection
]

{ #category : 'evaluating' }
DolphinCodeImporter >> evaluateDeclarations [

	parserClass := DolphinChunkFileFormatParser.
	toInstall := OrderedCollection new.
	self class current: self. 
	^[
		super evaluateDeclarations.
		toInstall do: [ :each | each install ] ] ensure: [ self class current: nil ]
	
]

"
I represent a collection (e.g. of class names) belonging to a Dolphin Package.
"
Class {
	#name : 'DolphinPackageCollection',
	#superclass : 'Object',
	#instVars : [
		'package',
		'items'
	],
	#category : 'Dolphin to Pharo',
	#package : 'Dolphin to Pharo'
}

{ #category : 'class initialization' }
DolphinPackageCollection class >> initialize [

	self class environment at: #Package put: RPackage
]

{ #category : 'class initialization' }
DolphinPackageCollection class >> uninitialize [

	self class environment removeKey: #Package
]

{ #category : 'adding' }
DolphinPackageCollection >> add: anObject [

	^items add: anObject
]

{ #category : 'initialization' }
DolphinPackageCollection >> initialize [

	super initialize.
	items := OrderedCollection new.
	DolphinCodeImporter current addToInstall: self
]

{ #category : 'accessing' }
DolphinPackageCollection >> package [
	^ package
]

{ #category : 'accessing' }
DolphinPackageCollection >> package: anObject [
	package := anObject
]

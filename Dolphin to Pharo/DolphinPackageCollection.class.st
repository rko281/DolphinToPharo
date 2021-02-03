"
I represent a collection (e.g. of class names) belonging to a Dolphin Package.
"
Class {
	#name : #DolphinPackageCollection,
	#superclass : #Object,
	#instVars : [
		'package'
	],
	#category : #'Dolphin to Pharo'
}

{ #category : #'class initialization' }
DolphinPackageCollection class >> initialize [

	self class environment at: #Package put: RPackage
]

{ #category : #'class initialization' }
DolphinPackageCollection class >> uninitialize [

	self class environment removeKey: #Package
]

{ #category : #adding }
DolphinPackageCollection >> add: anObject [

	self subclassResponsibility 
]

{ #category : #accessing }
DolphinPackageCollection >> package [
	^ package
]

{ #category : #accessing }
DolphinPackageCollection >> package: anObject [
	package := anObject
]

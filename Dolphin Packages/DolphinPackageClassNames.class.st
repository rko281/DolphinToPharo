"
I support adding classes to an RPackage when filing in a Dolphin Package.
"
Class {
	#name : #DolphinPackageClassNames,
	#superclass : #DolphinPackageCollection,
	#category : #'Dolphin Packages'
}

{ #category : #adding }
DolphinPackageClassNames >> add: aClassName [

	self package addClassDefinitionName: aClassName
]

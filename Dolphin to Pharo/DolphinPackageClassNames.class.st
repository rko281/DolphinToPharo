"
I support adding classes to an RPackage when filing in a Dolphin Package.
"
Class {
	#name : 'DolphinPackageClassNames',
	#superclass : 'DolphinPackageCollection',
	#category : 'Dolphin to Pharo',
	#package : 'Dolphin to Pharo'
}

{ #category : 'adding' }
DolphinPackageClassNames >> install [

	items do: [ :each | self package addClass: (self class environment at: each)]
]

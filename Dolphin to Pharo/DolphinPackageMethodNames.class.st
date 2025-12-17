"
I support adding methods to an RPackage when filing in a Dolphin Package.
"
Class {
	#name : 'DolphinPackageMethodNames',
	#superclass : 'DolphinPackageCollection',
	#category : 'Dolphin to Pharo',
	#package : 'Dolphin to Pharo'
}

{ #category : 'adding' }
DolphinPackageMethodNames >> install [

	items do: 
		[ :each || cls |
		(each key includes: Character space)
			ifTrue: [ cls := (self class environment at: (each key readStream upTo: $ ) asSymbol) class ]
			ifFalse: [ cls := self class environment at: each key ].
	
		self package addMethod: (cls>>each value)]
]

"
I support adding methods to an RPackage when filing in a Dolphin Package.
"
Class {
	#name : #DolphinPackageMethodNames,
	#superclass : #DolphinPackageCollection,
	#category : #'Dolphin to Pharo'
}

{ #category : #adding }
DolphinPackageMethodNames >> add: anAssociation [

	| className |

	(anAssociation key includes: Character space)
	ifTrue: 
			[className := (self class environment at: (anAssociation key readStream upTo: $ )) name.
			 self package addSelector: anAssociation value ofMetaclassName: className ]
	ifFalse: 
			[className := (self class environment at: anAssociation key) name.
			 self package addSelector: anAssociation value ofClassName: className ].
		
	self package organizer registerExtendingPackage: package forClassName: className
]

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
			[className := anAssociation key readStream upTo: $ .
			 self package addSelector: anAssociation value ofMetaclassName: className ]
	ifFalse: 
			[className := anAssociation key.
			 self package addSelector: anAssociation value ofClassName: anAssociation key ].
		
	self package organizer registerExtendingPackage: package forClassName: className
]

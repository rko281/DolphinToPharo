Extension { #name : #RPackage }

{ #category : #'*Dolphin to Pharo' }
RPackage >> basicComment: aString [

	self packageComment: aString
]

{ #category : #'*Dolphin to Pharo' }
RPackage >> basicPackageVersion: aString [
]

{ #category : #'*Dolphin to Pharo' }
RPackage >> basicScriptAt: aSymbol put: aString [

	self propertyAt: aSymbol put: aString
]

{ #category : #'*Dolphin to Pharo' }
RPackage >> binaryGlobalNames: aCollection [

	"Not supported"
]

{ #category : #'*Dolphin to Pharo' }
RPackage >> classNames [ 

	^DolphinPackageClassNames new 
		package: self;
		yourself
]

{ #category : #'*Dolphin to Pharo' }
RPackage class >> currentDolphinPackage [

	"Stored in the properties of this package"
	
	^self dolphinPackages propertyAt: #currentDolphinPackage
]

{ #category : #'*Dolphin to Pharo' }
RPackage class >> currentDolphinPackage: anRPackage [

	"Store in the properties of this package"
	
	^self dolphinPackages propertyAt: #currentDolphinPackage put: anRPackage
]

{ #category : #'*Dolphin to Pharo' }
RPackage class >> dolphinPackages [

	"This actual package"

	^self organizer packageNamed: 'Dolphin Packages'
]

{ #category : #'*Dolphin to Pharo' }
RPackage >> globalAliases: aCollection [

	"Not supported"
]

{ #category : #'*Dolphin to Pharo' }
RPackage >> globalNames [

	^self propertyAt: #globalNames ifAbsentPut: [ Set new ]
]

{ #category : #'*Dolphin to Pharo' }
RPackage class >> manager [

	"Dolphin compatibility - Package manager == RPackage organizer"

	^self organizer
]

{ #category : #'*Dolphin to Pharo' }
RPackage >> methodNames [ 

	^DolphinPackageMethodNames new 
		package: self;
		yourself
]

{ #category : #'*Dolphin to Pharo' }
RPackage class >> name: aString [

	| dolphinPackage |
	
	dolphinPackage := self named: aString.
	self currentDolphinPackage: dolphinPackage.
	^dolphinPackage
]

{ #category : #'*Dolphin to Pharo' }
RPackage >> paxVersion: anInteger [
]

{ #category : #'*Dolphin to Pharo' }
RPackage >> preDeclareClassesOnLoad: aBoolean [
]

{ #category : #'*Dolphin to Pharo' }
RPackage >> setManualPrerequisites: aCollection [

	"Not supported"
]

{ #category : #'*Dolphin to Pharo' }
RPackage >> setPrerequisites: aCollection [

	aCollection do: 
		[ :each || packageFilename | 
		(self organizer includesPackageNamed: each) ifFalse: 
			[packageFilename := each, '.pac'.
			packageFilename asFileReference exists ifTrue: [ CodeImporter evaluateDolphinFileNamed: packageFilename] ]].

	self class currentDolphinPackage: self 
]

Extension { #name : 'Package' }

{ #category : '*Dolphin to Pharo' }
Package >> addSelector: aSymbol ofClassName: className [

	^self addMethod: (self environment at: className)>>aSymbol
]

{ #category : '*Dolphin to Pharo' }
Package >> addSelector: aSymbol ofMetalassName: className [

	^self addMethod: (self environment at: className) class>>aSymbol
]

{ #category : '*Dolphin to Pharo' }
Package >> basicComment: aString [

	self packageComment: aString
]

{ #category : '*Dolphin to Pharo' }
Package >> basicPackageVersion: aString [
]

{ #category : '*Dolphin to Pharo' }
Package >> basicScriptAt: aSymbol put: aString [

	self propertyAt: aSymbol put: aString
]

{ #category : '*Dolphin to Pharo' }
Package >> binaryGlobalNames: aCollection [

	"Not supported"
]

{ #category : '*Dolphin to Pharo' }
Package >> classNames [ 

	^DolphinPackageClassNames new 
		package: self;
		yourself
]

{ #category : '*Dolphin to Pharo' }
Package class >> currentDolphinPackage [

	"Stored in the properties of this package"
	
	^self dolphinPackages propertyAt: #currentDolphinPackage
]

{ #category : '*Dolphin to Pharo' }
Package class >> currentDolphinPackage: anRPackage [

	"Store in the properties of this package"
	
	^self dolphinPackages propertyAt: #currentDolphinPackage put: anRPackage
]

{ #category : '*Dolphin to Pharo' }
Package class >> dolphinPackages [

	"This actual package"

	^Package manager packageNamed: 'Dolphin to Pharo'
]

{ #category : '*Dolphin to Pharo' }
Package >> globalAliases: aCollection [

	"Not supported"
]

{ #category : '*Dolphin to Pharo' }
Package >> globalNames [

	^self propertyAt: #globalNames ifAbsentPut: [ Set new ]
]

{ #category : '*Dolphin to Pharo' }
Package >> includesSelector: aSymbol ofClassName: className [


	^(self definedClasses detect: [ :class | class name = className ] ifNone: [ nil ])
		ifNil: [ false ]
		ifNotNil: [ :cls | self includesSelector: aSymbol ofClass: cls ]
]

{ #category : '*Dolphin to Pharo' }
Package >> includesSelector: aSymbol ofMetaclassName: className [


	^(self definedClasses detect: [ :class | class name = className ] ifNone: [ nil ])
		ifNil: [ false ]
		ifNotNil: [ :cls | self includesSelector: aSymbol ofClass: cls class ]
]

{ #category : '*Dolphin to Pharo' }
Package class >> manager [

	"Dolphin compatibility - Package manager == RPackage organizer"

	^PackageOrganizer default
]

{ #category : '*Dolphin to Pharo' }
Package >> methodNames [ 

	^DolphinPackageMethodNames new 
		package: self;
		yourself
]

{ #category : '*Dolphin to Pharo' }
Package class >> name: aString [

	| dolphinPackage |
	
	dolphinPackage := self named: aString.
	self currentDolphinPackage: dolphinPackage.
	dolphinPackage register.
	^dolphinPackage
]

{ #category : '*Dolphin to Pharo' }
Package >> paxVersion: anInteger [
]

{ #category : '*Dolphin to Pharo' }
Package >> preDeclareClassesOnLoad: aBoolean [
]

{ #category : '*Dolphin to Pharo' }
Package >> register [

	PackageOrganizer default addPackage: self
]

{ #category : '*Dolphin to Pharo' }
Package >> setManualPrerequisites: aCollection [

	"Not supported"
]

{ #category : '*Dolphin to Pharo' }
Package >> setPrerequisites: aCollection [

	aCollection do: 
		[ :each || packageFilename | 
		(PackageOrganizer default hasPackage: each) ifFalse: 
			[packageFilename := each, '.pac'.
			packageFilename asFileReference exists ifTrue: [ CodeImporter evaluateDolphinFileNamed: packageFilename] ]].

	self class currentDolphinPackage: self 
]

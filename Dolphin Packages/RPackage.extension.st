Extension { #name : #RPackage }

{ #category : #'*Dolphin Packages' }
RPackage >> basicComment: aString [

	self packageComment: aString
]

{ #category : #'*Dolphin Packages' }
RPackage >> basicScriptAt: aSymbol put: aString [

	self propertyAt: aSymbol put: aString
]

{ #category : #'*Dolphin Packages' }
RPackage >> binaryGlobalNames: aCollection [

	"Not supported"
]

{ #category : #'*Dolphin Packages' }
RPackage >> classNames [ 

	^DolphinPackageClassNames new 
		package: self;
		yourself
]

{ #category : #'*Dolphin Packages' }
RPackage class >> currentDolphinPackage [

	"Stored in the properties of this package"
	
	^self dolphinPackages propertyAt: #currentDolphinPackage
]

{ #category : #'*Dolphin Packages' }
RPackage class >> currentDolphinPackage: anRPackage [

	"Store in the properties of this package"
	
	^self dolphinPackages propertyAt: #currentDolphinPackage put: anRPackage
]

{ #category : #'*Dolphin Packages' }
RPackage class >> dolphinPackages [

	"This actual package"

	^self organizer packageNamed: 'Dolphin Packages'
]

{ #category : #'*Dolphin Packages' }
RPackage >> globalAliases: aCollection [

	"Not supported"
]

{ #category : #'*Dolphin Packages' }
RPackage class >> manager [

	"Dolphin compatibility - Package manager == RPackage organizer"

	^self organizer
]

{ #category : #'*Dolphin Packages' }
RPackage >> methodNames [ 

	^DolphinPackageMethodNames new 
		package: self;
		yourself
]

{ #category : #'*Dolphin Packages' }
RPackage class >> name: aString [

	| dolphinPackage |
	
	dolphinPackage := self named: aString.
	dolphinPackage register.

	self currentDolphinPackage: dolphinPackage.
	^dolphinPackage
]

{ #category : #'*Dolphin Packages' }
RPackage >> paxVersion: anInteger [
]

{ #category : #'*Dolphin Packages' }
RPackage >> setManualPrerequisites: aCollection [

	"Not supported"
]

{ #category : #'*Dolphin Packages' }
RPackage >> setPrerequisites: aCollection [

	aCollection do: 
		[ :each || packageFilename | 
		(self organizer includesPackageNamed: each) ifFalse: 
			[packageFilename := each, '.pac'.
			packageFilename asFileReference exists ifTrue: [ CodeImporter evaluateDolphinFileNamed: packageFilename] ]].

	self class currentDolphinPackage: self 
]

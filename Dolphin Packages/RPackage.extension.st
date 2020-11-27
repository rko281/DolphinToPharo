Extension { #name : #RPackage }

{ #category : #'*Dolphin Packages' }
RPackage >> basicComment: aString [

	self packageComment: aString
]

{ #category : #'*Dolphin Packages' }
RPackage >> basicScriptAt: aSymbol put: aString [

	"Not supported"
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
RPackage >> globalAliases: aCollection [

	"Not supported"
]

{ #category : #'*Dolphin Packages' }
RPackage >> methodNames [ 

	^DolphinPackageMethodNames new 
		package: self;
		yourself
]

{ #category : #'*Dolphin Packages' }
RPackage class >> name: aString [

	CurrentDolphinPackage := self named: aString.
	CurrentDolphinPackage register.
	^CurrentDolphinPackage
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

	"Not supported"
]

Extension { #name : #Object }

{ #category : #'*Dolphin Packages' }
Object class >> variableByteSubclass: aSymbol instanceVariableNames: ivNames classVariableNames: cvNames poolDictionaries: pdNames classInstanceVariableNames: civNames [

	| newClass |

	newClass := self variableByteSubclass: aSymbol instanceVariableNames: ivNames classVariableNames: cvNames poolDictionaries: pdNames category: (CurrentDolphinPackage ifNil: [''] ifNotNil: [ :package | package name]).
	
	newClass class instanceVariableNames: civNames.
	
	^newClass
]

{ #category : #'*Dolphin Packages' }
Object class >> variableSubclass: aSymbol instanceVariableNames: ivNames classVariableNames: cvNames poolDictionaries: pdNames classInstanceVariableNames: civNames [

	| newClass |

	newClass := self variableSubclass: aSymbol instanceVariableNames: ivNames classVariableNames: cvNames poolDictionaries: pdNames category: (CurrentDolphinPackage ifNil: [''] ifNotNil: [ :package | package name]).
	
	newClass class instanceVariableNames: civNames.
	
	^newClass
]

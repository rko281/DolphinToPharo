Extension { #name : #ProtoObject }

{ #category : #'*Dolphin Packages' }
ProtoObject class >> guid: aGUID [
]

{ #category : #'*Dolphin Packages' }
ProtoObject class >> subclass: aSymbol instanceVariableNames: ivNames classVariableNames: cvNames poolDictionaries: pdNames classInstanceVariableNames: civNames [

	| newClass |

	newClass := self subclass: aSymbol instanceVariableNames: ivNames classVariableNames: cvNames poolDictionaries: pdNames package: (CurrentDolphinPackage ifNil: [''] ifNotNil: [ :package | package name]).
	
	newClass class instanceVariableNames: civNames.
	
	^newClass
]

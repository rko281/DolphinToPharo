Extension { #name : #ProtoObject }

{ #category : #'*Dolphin to Pharo' }
ProtoObject class >> guid: aGUID [
]

{ #category : #'*Dolphin to Pharo' }
ProtoObject class >> subclass: aSymbol instanceVariableNames: ivNames classVariableNames: cvNames poolDictionaries: pdNames classInstanceVariableNames: civNames [

	| newClass |

	newClass := self subclass: aSymbol instanceVariableNames: ivNames classVariableNames: cvNames poolDictionaries: pdNames package: (RPackage currentDolphinPackage ifNil: [''] ifNotNil: [ :package | package name]).
	
	newClass class instanceVariableNames: civNames.
	
	^newClass
]

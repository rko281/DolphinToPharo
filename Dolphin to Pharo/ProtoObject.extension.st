Extension { #name : 'ProtoObject' }

{ #category : '*Dolphin to Pharo' }
ProtoObject class >> guid: aGUID [
]

{ #category : '*Dolphin to Pharo' }
ProtoObject class >> subclass: aSymbol instanceVariableNames: ivNames classVariableNames: cvNames poolDictionaries: pdNames classInstanceVariableNames: civNames [

	| builder |

	builder := self << aSymbol.
	builder 
		slots: (ivNames substrings collect: [ :each | each asSymbol]);
		classSlots: (civNames substrings collect: [ :each | each asSymbol]);
		sharedVariables: (ivNames substrings collect: [ :each | each asSymbol]);
		package: (Package currentDolphinPackage ifNil: ['_UnpackagedPackage'] ifNotNil: [ :package | package name]).

	^builder install
]

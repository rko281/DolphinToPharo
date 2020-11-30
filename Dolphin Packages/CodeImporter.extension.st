Extension { #name : #CodeImporter }

{ #category : #'*Dolphin Packages' }
CodeImporter >> evaluateDolphin [

	parserClass := DolphinChunkFileFormatParser.
	^ self evaluateDeclarations
]

{ #category : #'*Dolphin Packages' }
CodeImporter class >> evaluateDolphinFileNamed: aFileName [
	^(self fileNamed: aFileName) evaluateDolphin
]

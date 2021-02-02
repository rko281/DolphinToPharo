Extension { #name : #CodeImporter }

{ #category : #'*Dolphin to Pharo' }
CodeImporter >> evaluateDolphin [

	parserClass := DolphinChunkFileFormatParser.
	^self evaluateDeclarations
]

{ #category : #'*Dolphin to Pharo' }
CodeImporter class >> evaluateDolphinFileNamed: aFileName [
	^(self fileNamed: aFileName) evaluateDolphin
]

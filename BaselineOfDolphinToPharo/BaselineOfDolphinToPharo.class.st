Class {
	#name : #BaselineOfDolphinToPharo,
	#superclass : #BaselineOf,
	#category : #BaselineOfDolphinToPharo
}

{ #category : #baselines }
BaselineOfDolphinToPharo >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
				spec
					package: 'Dolphin Packages']
]

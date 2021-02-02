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
				self porpoise: spec.
				spec
					package: 'Dolphin to Pharo' with: [ spec requires: #('Porpoise') ] .
				
				spec
					group: 'default' with: #('Dolphin to Pharo')]
]

{ #category : #baselines }
BaselineOfDolphinToPharo >> porpoise: spec [

	spec
		baseline: 'Porpoise'
		with: [
			spec
				repository: 'github://rko281/Porpoise/src'
		]
]

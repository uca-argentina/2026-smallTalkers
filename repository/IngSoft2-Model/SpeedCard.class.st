Class {
	#name : 'SpeedCard',
	#superclass : 'Card',
	#instVars : [
		'targetShip'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'testing' }
SpeedCard >> isInstant [
	^ false
]

{ #category : 'testing' }
SpeedCard >> playBy: aShip targeting: aTargetShip in: aGame [
	targetShip := aTargetShip.
	aGame activatePermanentCard: self playedBy: aShip.
]

{ #category : 'testing' }
SpeedCard >> rollModifierFor: aShip [
	aShip = targetShip ifTrue: [ ^ 1 ].
	^ 0
]

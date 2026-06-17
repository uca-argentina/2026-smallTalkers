Class {
	#name : 'AccelerationCard',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'testing' }
AccelerationCard >> isInstant [
	^ false
]

{ #category : 'testing' }
AccelerationCard >> playBy: aShip targeting: aTargetShip in: aGame [
	aGame activatePermanentCard: self playedBy: aShip.
]

{ #category : 'testing' }
AccelerationCard >> rollModifierFor: aShip [
	^ 1
]

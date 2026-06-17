Class {
	#name : 'CancelationCard',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'testing' }
CancelationCard >> isInstant [
	^ true
]

{ #category : 'testing' }
CancelationCard >> playBy: aShip targeting: aTargetCard in: aGame [
	aGame deactivatePermanentCard: aTargetCard playedBy: aShip.
]

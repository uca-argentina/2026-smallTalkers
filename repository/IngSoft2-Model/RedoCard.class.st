Class {
	#name : 'RedoCard',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
RedoCard >> play: aShip in: aGame target: aTargetShip [
	| effective |
	aGame hasEnded ifTrue: [ Error signal: 'The Game Is Already Over' ].
	effective := aGame lastEffectiveCard.
	effective isPermanent
		ifTrue: [ aGame addPermanentCard: effective target: aTargetShip ]
		ifFalse: [ aGame lastTileEffect applyTo: aTargetShip in: aGame ].
]

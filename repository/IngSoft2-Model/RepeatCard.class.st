Class {
	#name : 'RepeatCard',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'testing' }
RepeatCard >> isPermanent [
	^false.
]

{ #category : 'testing' }
RepeatCard >> play: aShip in: aGame on: aTargetShip [
	aGame hasEnded ifTrue: [ Error signal: 'The Game Is Already Over' ].
	aGame lastTileEffect applyTo: aTargetShip in: aGame.
]

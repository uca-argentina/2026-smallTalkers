Class {
	#name : 'HyperJump',
	#superclass : 'TileEffect',
	#instVars : [
		'parsecsList',
		'currentIndex'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
HyperJump class >> withLightyears: aCollection [
	aCollection isEmpty ifTrue: [ Error signal: 'Hyperjump needs at least one light-year value' ].
	^ self new initializeWithParsecs: (aCollection collect: [ :ly | ly / 3 ]).
]

{ #category : 'as yet unclassified' }
HyperJump class >> withParsecs: aCollection [

aCollection isEmpty ifTrue: [ Error signal: 'Hyperjump needs at least one parsec value' ].
^ self new initializeWithParsecs: aCollection.
]

{ #category : 'as yet unclassified' }
HyperJump >> applyTo: aShip in: aGame [

	| parsecs tiles |
	parsecs := parsecsList at: currentIndex.
	tiles := aGame parsecsToTiles: parsecs.
	aGame moveShip: aShip by: tiles.
	currentIndex := (currentIndex rem: parsecsList size) + 1.


]

{ #category : 'initialization' }
HyperJump >> initializeWithParsecs: aCollection [

parsecsList := aCollection asSortedCollection: [ :a :b | a > b ].
currentIndex := 1.
]

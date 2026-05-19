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
HyperJump class >> withParsecs: aCollection [

aCollection isEmpty ifTrue: [ Error signal: 'Hyperjump needs at least one parsec value' ].
^ self new initializeWithParsecs: aCollection.
]

{ #category : 'as yet unclassified' }
HyperJump >> applyTo: aShip in: aGame [

| parsecs |
parsecs := parsecsList at: currentIndex.
aGame moveShip: aShip by: parsecs.
currentIndex := (currentIndex rem: parsecsList size) + 1.


]

{ #category : 'initialization' }
HyperJump >> initializeWithParsecs: aCollection [

parsecsList := aCollection asSortedCollection: [ :a :b | a > b ].
currentIndex := 1.
]

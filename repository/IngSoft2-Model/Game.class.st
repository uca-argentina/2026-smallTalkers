Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'totalOfTiles',
		'winner',
		'positions',
		'currentShip'
	],
	#classInstVars : [
		'totalOfTiles',
		'position'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Game class >> default [
	^ self new initializeWithTiles: 10 ships: 1.
]

{ #category : 'accessing' }
Game class >> withTiles: anInteger [
	anInteger = 0 ifTrue: [ Error signal: 'The Total Of Tiles Cannot Be 0'].
	^ self new initializeWithTiles: anInteger ships: 1.
]

{ #category : 'as yet unclassified' }
Game class >> withTiles: anInteger ships: aShipCount [

	anInteger <= 0 ifTrue: [
		Error signal: 'The Total Of Tiles Cannot Be 0' ].
	aShipCount <= 0 ifTrue: [ Error signal: 'The Ship Count Cannot Be 0' ].
	^ self new initializeWithTiles: anInteger ships: aShipCount
]

{ #category : 'as yet unclassified' }
Game >> advanceTurn [
	currentShip := (currentShip rem:positions size) + 1
]

{ #category : 'testing' }
Game >> hasEnded [
 	^ winner notNil.
]

{ #category : 'testing' }
Game >> initializeWith: anInteger and: anInteger2 [
	position := anInteger.
	totalOfTiles := anInteger2.
	winner := nil.
]

{ #category : 'testing' }
Game >> initializeWithTiles: anInteger ships: aShipCount [

	totalOfTiles := anInteger.
	positions := Array new: aShipCount withAll: 0.
	winner := nil.
	currentShip := 1
]

{ #category : 'as yet unclassified' }
Game >> moveShip: aShipIndex forward: anInteger [

	| newPosition |
	self hasEnded ifTrue: [ Error signal: 'The Game Is Already Over' ].
	newPosition := (positions at: currentShip ) + anInteger.
	positions at: currentShip put: newPosition.
	newPosition >= totalOfTiles ifTrue: [ winner := currentShip ].
	self advanceTurn
]

{ #category : 'as yet unclassified' }
Game >> moveShipforward: anInteger [

	| newPosition |
	self hasEnded ifTrue: [ Error signal: 'The Game Is Already Over' ].
	newPosition := (positions at: currentShip ) + anInteger.
	positions at: currentShip put: newPosition.
	newPosition >= totalOfTiles ifTrue: [ winner := currentShip ].
	self advanceTurn
]

{ #category : 'as yet unclassified' }
Game >> positionOf: aShipIndex [ 
	^ positions at: aShipIndex.
]

{ #category : 'as yet unclassified' }
Game >> winner [
	^ winner.
]

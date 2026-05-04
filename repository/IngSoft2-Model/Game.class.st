Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'totalOfTiles',
		'winner',
		'positions',
		'currentShip',
		'dice',
		'board'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Game class >> default [
	| aBoard |
	aBoard := Board withTiles: 10.
	^ self new initializeWithBoard: aBoard ships: 1.
]

{ #category : 'accessing' }
Game class >> withBoard: aBoard [
	^ self new initializeWithBoard: aBoard ships: 1.
]

{ #category : 'as yet unclassified' }
Game class >> withBoard: aBoard ships: aShipCount [
	^ self new initializeWithBoard: aBoard ships: aShipCount
]

{ #category : 'as yet unclassified' }
Game class >> withBoard: aBoard ships: aShipCount dice: aDice [

	aShipCount <= 0 ifTrue: [ Error signal: 'The Ship Count Cannot Be 0' ].
	aDice isEmpty ifTrue: [ Error signal: 'The Dice Collection Cannot Be Empty' ].
	^ self new initializeWithBoard: aBoard ships: aShipCount dice: aDice
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
Game >> initializeWithBoard: aBoard  ships: aShipCount [

	board := aBoard .
	positions := Array new: aShipCount withAll: 0.
	winner := nil.
	currentShip := 1
]

{ #category : 'testing' }
Game >> initializeWithBoard: aBoard ships: aShipCount dice: aDice [

	board := aBoard.
	positions := Array new: aShipCount withAll: 0.
	winner := nil.
	currentShip := 1.
	dice:= aDice.
]

{ #category : 'as yet unclassified' }
Game >> moveShip [

    | newPosition roll |
    self hasEnded ifTrue: [ Error signal: 'The Game Is Already Over' ].
    roll := dice inject: 0 into: [:sum :aDice | sum + aDice roll].
    newPosition := (positions at: currentShip) + roll.
    positions at: currentShip put: newPosition.
	 (board isWinningPosition: newPosition) ifTrue: [ winner := currentShip ].
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

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
 	^ winner isNull not.
]

{ #category : 'testing' }
Game >> initializeWithBoard: aBoard  ships: aShipCount [

	board := aBoard .
	positions := Array new: aShipCount withAll: 0.
	winner := NullShip new.
	currentShip := 1
]

{ #category : 'testing' }
Game >> initializeWithBoard: aBoard ships: aShipCount dice: aDice [
    board := aBoard.
    positions := (1 to: aShipCount) collect: [ :i | Ship new ].
    winner := NullShip new.
    currentShip := 1.
    dice := aDice.
]

{ #category : 'as yet unclassified' }
Game >> moveShip [
    | roll currentShipObject |
    self hasEnded ifTrue: [ Error signal: 'The Game Is Already Over' ].
    roll := dice inject: 0 into: [:sum :aDice | sum + aDice roll].
    currentShipObject := positions at: currentShip.
    currentShipObject moveForward: roll.
    (board isWinningPosition: currentShipObject position) ifTrue: [ winner := currentShipObject ].
    self advanceTurn.
]

{ #category : 'as yet unclassified' }
Game >> positionOf: aShip [
    ^ aShip position
]

{ #category : 'as yet unclassified' }
Game >> ships [
    ^ positions
]

{ #category : 'as yet unclassified' }
Game >> winner [
	^ winner.
]

Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'winner',
		'ships',
		'currentShip',
		'dice',
		'board',
		'hasEnded'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> withBoard: aBoard ships: aShipCollection dice: aDice [

	aShipCollection size <= 0 ifTrue: [ Error signal: 'The Ship Count Cannot Be 0' ].
	aDice isEmpty ifTrue: [ Error signal: 'The Dice Collection Cannot Be Empty' ].
	^ self new initializeWithBoard: aBoard ships: aShipCollection dice: aDice
]

{ #category : 'as yet unclassified' }
Game >> advanceTurn [
	currentShip := (currentShip rem: ships size) + 1
]

{ #category : 'testing' }
Game >> hasEnded [
 	^ hasEnded 
]

{ #category : 'testing' }
Game >> initializeWithBoard: aBoard ships: aShipCollection dice: aDice [
    board := aBoard.
    ships := aShipCollection.
    winner := NullShip new.
	 hasEnded := false.
    currentShip := 1.
    dice := aDice.
]

{ #category : 'as yet unclassified' }
Game >> moveShip [
    | roll currentShipObject |
    self hasEnded ifTrue: [ Error signal: 'The Game Is Already Over' ].
    roll := dice inject: 0 into: [:sum :aDice | sum + aDice roll].
    currentShipObject := ships at: currentShip.
    currentShipObject moveForward: roll onBoard: board.           
    (board isWinningPosition: currentShipObject laps ) ifTrue: [
        winner := currentShipObject.
        hasEnded := true
    ].
    self advanceTurn.
]

{ #category : 'as yet unclassified' }
Game >> positionOf: aShip [
    ^ aShip position
]

{ #category : 'as yet unclassified' }
Game >> ships [
    ^ ships
]

{ #category : 'as yet unclassified' }
Game >> winner [
	^ winner.
]

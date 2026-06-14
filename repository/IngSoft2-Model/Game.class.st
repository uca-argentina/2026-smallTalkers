Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'winner',
		'ships',
		'currentShip',
		'dice',
		'board',
		'hasEnded',
		'cardDeck',
		'activePermanentCards',
		'lastTileEffect',
		'lastEffectiveCard'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> withBoard: aBoard ships: aShipCollection dice: aDice [

	aShipCollection size <= 0 ifTrue: [ Error signal: 'The Ship Count Cannot Be 0' ].
	aDice isEmpty ifTrue: [ Error signal: 'The Dice Collection Cannot Be Empty' ].
	^ self new initializeWithBoard: aBoard ships: aShipCollection dice: aDice cardDeck: OrderedCollection new
]

{ #category : 'as yet unclassified' }
Game class >> withBoard: aBoard ships: aShipCollection dice: aDice cardDeck: aDeck [

	aShipCollection size <= 0 ifTrue: [ Error signal: 'The Ship Count Cannot Be 0' ].
	aDice isEmpty ifTrue: [ Error signal: 'The Dice Collection Cannot Be Empty' ].
	^ self new initializeWithBoard: aBoard ships: aShipCollection dice: aDice cardDeck: aDeck 
]

{ #category : 'as yet unclassified' }
Game >> advanceTurn [

	currentShip := (currentShip rem: ships size) + 1
]

{ #category : 'as yet unclassified' }
Game >> drawCard [
	^ cardDeck draw

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

{ #category : 'testing' }
Game >> initializeWithBoard: aBoard ships: aShipCollection dice: aDice cardDeck: aDeck [
    board := aBoard.
    ships := aShipCollection.
    winner := NullShip new.
	 hasEnded := false.
    currentShip := 1.
    dice := aDice.
	 cardDeck := aDeck.
	 activePermanentCards := OrderedCollection new.
	 lastTileEffect := NullEffect new.
	 lastEffectiveCard := nil.
	 ships do: [ :ship |
			ship receiveCard: cardDeck draw.
			ship receiveCard: cardDeck draw.
		].
]

{ #category : 'as yet unclassified' }
Game >> lapsOf: aShip [
    ^ aShip laps
]

{ #category : 'as yet unclassified' }
Game >> moveAllShipsExcept: aShip by: anInteger [ 
	"Usado por MoonWalk: mueve todas las naves excepto la indicada"
	ships do: [ :each |
		each = aShip ifFalse: [ self moveShip: each by: anInteger ]
	]

]

{ #category : 'as yet unclassified' }
Game >> moveShip [
    | roll currentShipObject |
    self hasEnded ifTrue: [ Error signal: 'The Game Is Already Over' ].
    roll := dice inject: 0 into: [:sum :aDice | sum + aDice roll].
    currentShipObject := ships at: currentShip.
    currentShipObject moveForward: roll onBoard: board. 
	 (board effectAt: currentShipObject position) applyTo: currentShipObject in: self.          
    (board isWinningPosition: currentShipObject laps ) ifTrue: [
        winner := currentShipObject.
        hasEnded := true
    ].
    self advanceTurn.
]

{ #category : 'as yet unclassified' }
Game >> moveShip: aShip by: anInteger [

	aShip moveBy: anInteger onBoard: board.
]

{ #category : 'as yet unclassified' }
Game >> parsecsToTiles: aParsecs [ 
	"Delega la conversión al tablero, que conoce su longitud en parsecs."
	^ board parsecsToTiles: aParsecs
]

{ #category : 'as yet unclassified' }
Game >> positionOf: arg1 [

	^ arg1 position
]

{ #category : 'as yet unclassified' }
Game >> rankingOf: aShip [
    | shipsAhead |
    shipsAhead := ships count: [ :each | 
        (each laps > aShip laps) or: [ 
            (each laps = aShip laps) and: [ each position > aShip position ] 
        ]
    ].
    ^ shipsAhead + 1.
]

{ #category : 'as yet unclassified' }
Game >> resetAllShips [ 
	ships do: [ :each | each resetPosition ]

 

]

{ #category : 'as yet unclassified' }
Game >> shipAt: anIndex [ 
	^ ships at: anIndex


 

]

{ #category : 'as yet unclassified' }
Game >> shipCount [ 
	^ ships size



 

]

{ #category : 'as yet unclassified' }
Game >> ships [

	^ ships
]

{ #category : 'as yet unclassified' }
Game >> winner [
	^ winner.
]

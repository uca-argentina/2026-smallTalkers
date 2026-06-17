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
	^ self new initializeWithBoard: aBoard ships: aShipCollection dice: aDice
]

{ #category : 'as yet unclassified' }
Game class >> withBoard: aBoard ships: aShipCollection dice: aDice cardDeck: aDeck [

	aShipCollection size <= 0 ifTrue: [ Error signal: 'The Ship Count Cannot Be 0' ].
	aDice isEmpty ifTrue: [ Error signal: 'The Dice Collection Cannot Be Empty' ].
	^ self new initializeWithBoard: aBoard ships: aShipCollection dice: aDice cardDeck: aDeck 
]

{ #category : 'as yet unclassified' }
Game >> activatePermanentCard: aCard playedBy: aShip [
	activePermanentCards add: aCard.
]

{ #category : 'as yet unclassified' }
Game >> activePermanentCards [
	^ activePermanentCards copy
]

{ #category : 'adding' }
Game >> addPermanentCard: aCard target: aTargetShip [
	activePermanentCards add: aCard -> aTargetShip.
]

{ #category : 'as yet unclassified' }
Game >> advanceTurn [

	currentShip := (currentShip rem: ships size) + 1
]

{ #category : 'as yet unclassified' }
Game >> currentShipObject [
	^ ships at: currentShip
]

{ #category : 'as yet unclassified' }
Game >> deactivatePermanentCard: aCard playedBy: aShip [
	activePermanentCards isEmpty ifTrue: [
		Error signal: 'No permanent cards in play to cancel' ].
	activePermanentCards remove: aCard ifAbsent: [
		Error signal: 'That card is not currently active' ].
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
	self initializeWithBoard: aBoard ships: aShipCollection dice: aDice deck: CardDeck new
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

{ #category : 'testing' }
Game >> initializeWithBoard: aBoard ships: aShipCollection dice: aDice deck: aDeck [
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

{ #category : 'accessing' }
Game >> lastEffectiveCard [
	^ lastEffectiveCard
]

{ #category : 'as yet unclassified' }
Game >> lastTileEffect [
	^ lastTileEffect
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
	| roll currentShipObject anEffect |
	self hasEnded ifTrue: [ Error signal: 'The Game Is Already Over' ].
	roll := dice inject: 0 into: [ :sum :aDice | sum + aDice roll ].
	currentShipObject := ships at: currentShip.
	activePermanentCards do: [ :assoc |
			assoc value = currentShipObject ifTrue: [
				roll := assoc key applyEffectTo: roll for: currentShipObject ] ].
	currentShipObject moveBy: roll onBoard: board.
	anEffect := board effectAt: currentShipObject position.
	anEffect applyTo: currentShipObject in: self.
	lastTileEffect := anEffect.
	(board isWinningPosition: currentShipObject laps) ifTrue: [
			winner := currentShipObject.
			hasEnded := true ].
	self advanceTurn
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
Game >> playCard: aCard by: aShip targeting: aTarget [
	hasEnded ifTrue: [ Error signal: 'Cannot play cards after the game has ended' ].
	(aShip hasCard: aCard) ifFalse: [ Error signal: 'Card not in hand' ].

	aCard isPermanent ifTrue: [
		aShip = self currentShipObject ifFalse: [
			Error signal: 'Permanent cards can only be played during the ship''s own turn' ] ].

	aShip removeCard: aCard.
	aCard playBy: aShip targeting: aTarget in: self.
	lastEffectiveCard := aCard.
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

{ #category : 'accessing' }
Game >> setLastEffectiveCard: aCard [
	lastEffectiveCard := aCard
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

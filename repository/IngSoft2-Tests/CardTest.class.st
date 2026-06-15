Class {
	#name : 'CardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CardTest >> test001ShipStartsWithEmptyHand [ 
	| ship |
	ship := Ship new.
	self assert: ship hand isEmpty.

]

{ #category : 'tests' }
CardTest >> test002ShipsStartsWithTwoCards [ 
| aBoard aShip aDice aGame anEffect aRolls ship1 aCardDeck |
    aRolls := OrderedCollection new.
    1 to: 5 do: [ :i |
        i = 3
            ifTrue: [ aRolls add: 0.99 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffect := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 4 laps: 1 effects: anEffect.
    ship1 := Ship new.
    aShip := OrderedCollection with: ship1.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 4 andValue: 4).
	 aCardDeck := CardDeckHardcoded withCards: (OrderedCollection with: NullCard with: NullCard with: NullCard ).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice cardDeck: aCardDeck.

]

{ #category : 'tests' }
CardTest >> test003ShipCanReceiveCard [ 
	| ship card |
	ship := Ship new.
	card := SpeedCard new.
	ship receiveCard: card.
	self assert: (ship hasCard: card).


]

{ #category : 'tests' }
CardTest >> test004ShipCanRemoveCard [ 
	| ship card |
	ship := Ship new.
	card := SpeedCard new.
	ship receiveCard: card.
	ship removeCard: card.
	self deny: (ship hasCard: card).



]

{ #category : 'tests' }
CardTest >> test005RemovingAbsentCardRaisesError [ 
	| ship card |
	ship := Ship new.
	card := SpeedCard new.
	self should: [ ship removeCard: card ] raise: Error withExceptionDo: [:error | self assert: error messageText equals: 'Card not in hand'  ].


]

{ #category : 'tests' }
CardTest >> test006CardTileGivesOneCardToShip [ 
	| ship game effects board dice aCardDeck |
	effects := OrderedCollection new.
	19 timesRepeat: [ effects add: NullEffect new ].
	effects add: CardTile new.
	board := Board withTiles: 20 laps: 3 effects: effects.
	ship := Ship new.
	dice := OrderedCollection with: (DiceHardcoded withFaces: 6 andValue: 3).
	aCardDeck := CardDeckHardcoded withCards: (OrderedCollection with: NullCard with: NullCard with: NullCard).
	game := Game withBoard: board ships: (OrderedCollection with: ship) dice: dice cardDeck: aCardDeck.
	(board effectAt: 19) applyTo: ship in: game.
	self assert: ship hand size equals: 3.



]

{ #category : 'tests' }
CardTest >> test007OverloadCardIsPermanent [
	| card |
	card := OverloadCard new.
	self assert: card isPermanent.



]

{ #category : 'tests' }
CardTest >> test008OverloadReducesShipTotalRollByTwo [
	| aGame aDice aBoard aShip ship1 aCardDeck card |
	aBoard := Board withTiles: 10.
	ship1 := Ship new.
	aShip := OrderedCollection with: ship1.
	aDice := OrderedCollection with: (DiceHardcoded withFaces: 6 andValue: 5).
	aCardDeck := CardDeckHardcoded withCards: (OrderedCollection with: NullCard with: NullCard with: NullCard).
	aGame := Game withBoard: aBoard ships: aShip dice: aDice cardDeck: aCardDeck.

	card := OverloadCard new.
	ship1 receiveCard: card.

	card play: ship1 in: aGame target: ship1.
	aGame moveShip.

	"dado=5, overload resta 2 -> avanza 3"
	self assert: ship1 position equals: 3.



]

{ #category : 'tests' }
CardTest >> test009OverloadCanMakeShipGoBackwardsIfRollIsNegative [
	| aGame aDice aBoard ship1 ship2 aShips aCardDeck card |
	aBoard := Board withTiles: 10.
	ship1 := Ship new.
	ship2 := Ship new.
	aShips := OrderedCollection with: ship1 with: ship2.
	aDice := OrderedCollection with: (DiceHardcoded withFaces: 6 andValue: 1).
	aCardDeck := CardDeckHardcoded withCards: (OrderedCollection with: NullCard with: NullCard with: NullCard).
	aGame := Game withBoard: aBoard ships: aShips dice: aDice cardDeck: aCardDeck.

	card := OverloadCard new.
	ship1 receiveCard: card.

	"Posicionamos ship1 en 3 para poder ver el retroceso"
	ship1 moveBy: 3 onBoard: aBoard.

	card play: ship1 in: aGame target: ship1.
	aGame moveShip.

	"dado=1, overload resta 2 -> roll total = -1 -> ship1 retrocede de 3 a 2"
	self assert: ship1 position equals: 2.
	"ship2 no fue afectado por overload"
]

{ #category : 'tests' }
CardTest >> test010RepeatCardIsNotPermanent [
	| card |
	card := RepeatCard new.
	self deny: card isPermanent.
]

{ #category : 'tests' }
CardTest >> test011RepeatAppliesLastTileEffectToChosenShip [
	| aGame aDice aBoard ship1 aShips aCardDeck card effects |
	effects := OrderedCollection new.
	effects add: NullEffect new.   "indice 1 -> posicion 0"
	effects add: NullEffect new.   "indice 2 -> posicion 1"
	effects add: SpeedUp new.       "indice 3 -> posicion 2"
	7 timesRepeat: [ effects add: NullEffect new ].

	aBoard := Board withTiles: 20 laps: 1 effects: effects.

	ship1 := Ship new.
	aShips := OrderedCollection with: ship1.

	aDice := OrderedCollection with: (DiceHardcoded withFaces: 6 andValue: 2).
	aCardDeck := CardDeckHardcoded withCards: (OrderedCollection with: NullCard with: NullCard with: NullCard).
	aGame := Game withBoard: aBoard ships: aShips dice: aDice cardDeck: aCardDeck.

	card := RepeatCard new.
	ship1 receiveCard: card.

	"ship1 tira 2 -> cae en posicion 2 (SpeedUp) -> avanza 4 -> queda en posicion 6"
	aGame moveShip.
	self assert: ship1 position equals: 6.

	"ship1 juega Repeat eligiendo a ship1 -> se le aplica SpeedUp de nuevo (avanza 4) -> queda en 10"
	card play: ship1 in: aGame on: ship1.
	self assert: ship1 position equals: 10.
]

{ #category : 'tests' }
CardTest >> test012RepeatHasNoEffectIfLastTileHadNoEffect [
	| aGame aDice aBoard ship1 aShips aCardDeck card effects |
	effects := OrderedCollection new.
	10 timesRepeat: [ effects add: NullEffect new ].

	aBoard := Board withTiles: 20 laps: 1 effects: effects.

	ship1 := Ship new.
	aShips := OrderedCollection with: ship1.

	aDice := OrderedCollection with: (DiceHardcoded withFaces: 6 andValue: 2).
	aCardDeck := CardDeckHardcoded withCards: (OrderedCollection with: NullCard with: NullCard with: NullCard).
	aGame := Game withBoard: aBoard ships: aShips dice: aDice cardDeck: aCardDeck.

	card := RepeatCard new.
	ship1 receiveCard: card.

	"ship1 tira 2 -> cae en posicion 2, NullEffect -> sin movimiento extra"
	aGame moveShip.
	self assert: ship1 position equals: 2.

	"Repeat sobre NullEffect -> no hace nada"
	card play: ship1 in: aGame on: ship1.
	self assert: ship1 position equals: 2.
]

{ #category : 'tests' }
CardTest >> test013RepeatHasNoEffectIfNoOneRolledDiceYet [
	| aGame aDice aBoard ship1 aShips aCardDeck card |
	aBoard := Board withTiles: 20.
	ship1 := Ship new.
	aShips := OrderedCollection with: ship1.
	aDice := OrderedCollection with: (DiceHardcoded withFaces: 6 andValue: 2).
	aCardDeck := CardDeckHardcoded withCards: (OrderedCollection with: NullCard with: NullCard with: NullCard).
	aGame := Game withBoard: aBoard ships: aShips dice: aDice cardDeck: aCardDeck.

	card := RepeatCard new.
	ship1 receiveCard: card.

	"nadie movio todavia, Repeat no debe hacer nada"
	card play: ship1 in: aGame on: ship1.
	self assert: ship1 position equals: 0.
]

{ #category : 'tests' }
CardTest >> test014RepeatCannotBePlayedWhenGameHasEnded [
	| aGame aDice aBoard ship1 aShips aCardDeck card |
	aBoard := Board withTiles: 1.
	ship1 := Ship new.
	aShips := OrderedCollection with: ship1.
	aDice := OrderedCollection with: (DiceHardcoded withFaces: 6 andValue: 1).
	aCardDeck := CardDeckHardcoded withCards: (OrderedCollection with: NullCard with: NullCard with: NullCard).
	aGame := Game withBoard: aBoard ships: aShips dice: aDice cardDeck: aCardDeck.

	card := RepeatCard new.
	ship1 receiveCard: card.

	"board de 1 tile -> termina el juego"
	aGame moveShip.
	self assert: aGame hasEnded.

	self should: [ card play: ship1 in: aGame on: ship1 ]
		raise: Error
		withExceptionDo: [ :error | self assert: error messageText equals: 'The Game Is Already Over' ].
]

{ #category : 'tests' }
CardTest >> test015OverloadCannotBePlayedWhenGameHasEnded [
	| aGame aDice aBoard ship1 aShips aCardDeck card |
	aBoard := Board withTiles: 1.
	ship1 := Ship new.
	aShips := OrderedCollection with: ship1.
	aDice := OrderedCollection with: (DiceHardcoded withFaces: 6 andValue: 1).
	aCardDeck := CardDeckHardcoded withCards: (OrderedCollection with: NullCard with: NullCard with: NullCard).
	aGame := Game withBoard: aBoard ships: aShips dice: aDice cardDeck: aCardDeck.

	card := OverloadCard new.
	ship1 receiveCard: card.

	"board de 1 tile -> termina el juego"
	aGame moveShip.
	self assert: aGame hasEnded.

	self should: [ card play: ship1 in: aGame target: ship1 ]
		raise: Error
		withExceptionDo: [ :error | self assert: error messageText equals: 'The Game Is Already Over' ].
]

{ #category : 'tests' }
CardTest >> test016RedoRepeatsLastPlayedOverloadEffect [
	| aGame aDice aBoard ship1 aShips aCardDeck overload redo |
	aBoard := Board withTiles: 20.
	ship1 := Ship new.
	aShips := OrderedCollection with: ship1.
	aDice := OrderedCollection with: (DiceHardcoded withFaces: 6 andValue: 5).
	aCardDeck := CardDeckHardcoded withCards: (OrderedCollection with: NullCard with: NullCard with: NullCard).
	aGame := Game withBoard: aBoard ships: aShips dice: aDice cardDeck: aCardDeck.

	overload := OverloadCard new.
	redo := RedoCard new.
	ship1 receiveCard: overload.
	ship1 receiveCard: redo.

	"se juega Overload sobre ship1"
	overload play: ship1 in: aGame target: ship1.

	"Redo: se elige a ship1 nuevamente -> activa otro Overload sobre ship1"
	redo play: ship1 in: aGame target: ship1.

	"dado=5, dos Overloads activos (-2 cada uno) -> roll total = 1"
	aGame moveShip.
	self assert: ship1 position equals: 1.
]

{ #category : 'tests' }
CardTest >> test017RedoRepeatsLastPlayedRepeatEffect [
	| aGame aDice aBoard ship1 aShips aCardDeck repeat redo effects |
	effects := OrderedCollection new.
	effects add: NullEffect new.   "indice 1 -> posicion 0"
	effects add: NullEffect new.   "indice 2 -> posicion 1"
	effects add: SpeedUp new.       "indice 3 -> posicion 2"
	7 timesRepeat: [ effects add: NullEffect new ].

	aBoard := Board withTiles: 20 laps: 1 effects: effects.

	ship1 := Ship new.
	aShips := OrderedCollection with: ship1.

	aDice := OrderedCollection with: (DiceHardcoded withFaces: 6 andValue: 2).
	aCardDeck := CardDeckHardcoded withCards: (OrderedCollection with: NullCard with: NullCard with: NullCard).
	aGame := Game withBoard: aBoard ships: aShips dice: aDice cardDeck: aCardDeck.

	repeat := RepeatCard new.
	redo := RedoCard new.
	ship1 receiveCard: repeat.
	ship1 receiveCard: redo.

	"ship1 tira 2 -> cae en posicion 2 (SpeedUp) -> avanza 4 -> queda en posicion 6"
	aGame moveShip.
	self assert: ship1 position equals: 6.

	"se juega Repeat eligiendo ship1 -> SpeedUp se aplica de nuevo -> posicion 10"
	repeat play: ship1 in: aGame on: ship1.
	self assert: ship1 position equals: 10.

	"Redo: la ultima jugada fue Repeat -> repite ESE efecto (SpeedUp) sobre ship1 -> posicion 14"
	redo play: ship1 in: aGame target: ship1.
	self assert: ship1 position equals: 14.
]

{ #category : 'tests' }
CardTest >> test018RedoCannotBePlayedWhenGameHasEnded [
	| aGame aDice aBoard ship1 aShips aCardDeck redo |
	aBoard := Board withTiles: 1.
	ship1 := Ship new.
	aShips := OrderedCollection with: ship1.
	aDice := OrderedCollection with: (DiceHardcoded withFaces: 6 andValue: 1).
	aCardDeck := CardDeckHardcoded withCards: (OrderedCollection with: NullCard with: NullCard with: NullCard).
	aGame := Game withBoard: aBoard ships: aShips dice: aDice cardDeck: aCardDeck.

	redo := RedoCard new.
	ship1 receiveCard: redo.

	"board de 1 tile -> termina el juego"
	aGame moveShip.
	self assert: aGame hasEnded.

	self should: [ redo play: ship1 in: aGame target: ship1 ]
		raise: Error
		withExceptionDo: [ :error | self assert: error messageText equals: 'The Game Is Already Over' ].
]

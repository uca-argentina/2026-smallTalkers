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

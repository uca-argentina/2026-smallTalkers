Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameTest >> test001WhenThePositionIsLessThanTheTotalOfTilesTheGameIsNotOver [ 
	| aGame |
	aGame := Game default.
	self deny: (aGame hasEnded)
]

{ #category : 'tests' }
GameTest >> test002WhenThePositionIsLessThanTheConfigurableTotalOfTiles [
| aGame |
aGame := Game withTiles: 9.
self deny: (aGame hasEnded)
]

{ #category : 'tests' }
GameTest >> test002WhenThePositionIsLessThanTheConfigurableTotalOfTilesThenTheGame [ 
| aGame |
aGame := Game withTiles: 9.
self deny: (aGame hasEnded)
]

{ #category : 'tests' }
GameTest >> test003IfTheTotalOfTilesIs0ThenTheGameIsNotInitialized [
| aGame |
self should: [ aGame:= Game withTiles: 0 ]  raise: Error  withExceptionDo: [ :error | self assert: error messageText equals: 'The Total Of Tiles Cannot Be 0' ]
]

{ #category : 'tests' }
GameTest >> test004ifAPlayerReachesFinalPositionTheGameEnds [
    | aGame aDice aBoard |
    aDice := OrderedCollection with:(DiceHardcoded withFaces: 6 andValue: 1).
	 aBoard:= Board withTiles: 1.
    aGame := Game withBoard: aBoard ships: 1 dice: aDice.
    aGame moveShip.
    self assert: aGame hasEnded
]

{ #category : 'tests' }
GameTest >> test005aPlayerCannotMoveIfTheGameIsAlreadyOver [

   | aGame aDice aBoard |
   aDice := OrderedCollection with:(DiceHardcoded withFaces: 6 andValue: 1).
	aBoard:= Board withTiles: 1.
   aGame := Game withBoard: aBoard ships: 1 dice: aDice.
   aGame moveShip.
   self should: [ aGame moveShip ] raise: Error withExceptionDo: [ :error | self assert: error messageText equals: 'The Game Is Already Over' ]
]

{ #category : 'tests' }
GameTest >> test006aPlayerCanMoveVariousTilesAtOnce [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 11 andValue: 11).
	aBoard := Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 1 dice: aDice.
   aGame moveShip.
   self assert: aGame hasEnded
]

{ #category : 'tests' }
GameTest >> test006whenAPlayerExceedsFinalPositionThenTheGameEnds [

   | aGame aDice aBoard |

	aDice := OrderedCollection with:(DiceHardcoded withFaces: 15 andValue: 15).
	aBoard := Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 1 dice: aDice.
   aGame moveShip.
   self assert: aGame hasEnded

]

{ #category : 'tests' }
GameTest >> test007aPlayerCanKnowItsPosition [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 6 andValue: 5).
	aBoard := Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 1 dice: aDice.
   aGame moveShip.
   self assert: (aGame positionOf: 1) equals: 5
]

{ #category : 'tests' }
GameTest >> test008TheWinnerIsTheShipThatCrossedTheEnd [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 10 andValue: 10).
	aBoard := Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 1 dice: aDice.
   aGame moveShip.
   self assert: aGame winner equals: 1.
]

{ #category : 'tests' }
GameTest >> test009WhenTheGameIsNotOverThereIsNoWinner [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 6 andValue: 3).
	aBoard:= Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 1 dice: aDice.
   aGame moveShip.
   self assert: aGame winner isNil.
]

{ #category : 'tests' }
GameTest >> test010WhenAShipWinsWithMultipleShipsTheGameEnds [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 10 andValue: 10).
	aBoard:= Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 2 dice: aDice.
   aGame moveShip.
   self assert: aGame hasEnded.
]

{ #category : 'tests' }
GameTest >> test011TheWinnerIsTheShipThatCrossedTheEndWithMultipleShips [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 10 andValue: 9).
	aBoard:= Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 2 dice: aDice.
   aGame moveShip.
   aGame moveShip.
   aGame moveShip.
   self assert: aGame winner equals: 1.
]

{ #category : 'tests' }
GameTest >> test012AShipCannotMoveAfterAnotherShipWon [

    | aGame aDice aBoard |
	 aDice := OrderedCollection with:(DiceHardcoded withFaces: 10 andValue: 10).
	 aBoard:= Board withTiles: 10.
    aGame := Game withBoard: aBoard ships: 2 dice: aDice.
    aGame moveShip.
    self should: [ aGame moveShip ] raise: Error withExceptionDo: [ :error | self assert: error messageText equals: 'The Game Is Already Over' ].
]

{ #category : 'tests' }
GameTest >> test013CanKnowThePositionOfEachShipWithMultipleShips [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 7 andValue: 3).
	aBoard:= Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 2 dice: aDice.
   aGame moveShip.
   aGame moveShip.
   aGame moveShip.
   self assert: (aGame positionOf: 1) equals: 6.
   self assert: (aGame positionOf: 2) equals: 3.
]

{ #category : 'tests' }
GameTest >> test014CannotCreateAGameWithZeroShips [

	| aGame |
	self should: [ aGame := Game withTiles: 10 ships: 0 ] raise: Error withExceptionDo: [ :error |self assert: error messageText equals: 'The Ship Count Cannot Be 0' ]
]

{ #category : 'tests' }
GameTest >> test015TurnsRotateBetweenShips [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 6 andValue: 3).
	aBoard:= Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 2 dice: aDice.
   aGame moveShip.
   aGame moveShip.
   self assert: (aGame positionOf: 1) equals: 3.
   self assert: (aGame positionOf: 2) equals: 3.
]

{ #category : 'tests' }
GameTest >> test016TheWinnerIsTheShipWhoseTurnItWasWhenTheGameEnded [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 10 andValue: 10).
	aBoard:= Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 2 dice: aDice.
   aGame moveShip.
   self assert: aGame winner equals: 1.
]

{ #category : 'tests' }
GameTest >> test017ShipMovesTheSumOfAllDiceRolls [

	| aGame aDice aDice1 aDice2 aBoard |
	aDice:= OrderedCollection new.
	aDice1 := DiceHardcoded withFaces: 9 andValue: 9.
	aDice2 := DiceHardcoded withFaces: 6 andValue: 6.
	aDice add: aDice1.
	aDice add: aDice2.
	aBoard:= Board withTiles: 25.
   aGame := Game withBoard: aBoard ships: 2 dice: aDice.
	aGame moveShip.
	self assert: (aGame positionOf: 1) equals: 15
]

{ #category : 'tests' }
GameTest >> test018CannotCreateAGameWithEmptyDiceCollection [
    | aGame |
    self
        should: [ aGame := Game withTiles: 10 ships: 1 dice: OrderedCollection new ]
        raise: Error
        withExceptionDo: [ :error |self assert: error messageText equals: 'The Dice Collection Cannot Be Empty' ]
]

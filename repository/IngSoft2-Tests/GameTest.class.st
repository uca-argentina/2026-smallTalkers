Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameTest >> test001ifAPlayerReachesFinalPositionTheGameEnds [
    | aGame aDice aBoard |
    aDice := OrderedCollection with:(DiceHardcoded withFaces: 6 andValue: 1).
	 aBoard:= Board withTiles: 1.
    aGame := Game withBoard: aBoard ships: 1 dice: aDice.
    aGame moveShip.
    self assert: aGame hasEnded
]

{ #category : 'tests' }
GameTest >> test002aPlayerCannotMoveIfTheGameIsAlreadyOver [

   | aGame aDice aBoard |
   aDice := OrderedCollection with:(DiceHardcoded withFaces: 6 andValue: 1).
	aBoard:= Board withTiles: 1.
   aGame := Game withBoard: aBoard ships: 1 dice: aDice.
   aGame moveShip.
   self should: [ aGame moveShip ] raise: Error withExceptionDo: [ :error | self assert: error messageText equals: 'The Game Is Already Over' ]
]

{ #category : 'tests' }
GameTest >> test003whenAPlayerExceedsFinalPositionThenTheGameEnds [

   | aGame aDice aBoard |

	aDice := OrderedCollection with:(DiceHardcoded withFaces: 15 andValue: 15).
	aBoard := Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 1 dice: aDice.
   aGame moveShip.
   self assert: aGame hasEnded

]

{ #category : 'tests' }
GameTest >> test004aPlayerCanKnowItsPosition [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 6 andValue: 5).
	aBoard := Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 1 dice: aDice.
   aGame moveShip.
   self assert: (aGame ships at: 1) position equals: 5.
]

{ #category : 'tests' }
GameTest >> test005TheWinnerIsTheShipThatCrossedTheEnd [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 10 andValue: 10).
	aBoard := Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 1 dice: aDice.
   aGame moveShip.
   self assert: aGame winner equals: (aGame ships at: 1).
]

{ #category : 'tests' }
GameTest >> test006WhenTheGameIsNotOverThereIsNoWinner [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 6 andValue: 3).
	aBoard:= Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 1 dice: aDice.
   aGame moveShip.
   self assert: aGame winner isNull.
]

{ #category : 'tests' }
GameTest >> test007WhenAShipWinsWithMultipleShipsTheGameEnds [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 10 andValue: 10).
	aBoard:= Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 2 dice: aDice.
   aGame moveShip.
   self assert: aGame hasEnded.
]

{ #category : 'tests' }
GameTest >> test008TheWinnerIsTheShipThatCrossedTheEndWithMultipleShips [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 10 andValue: 9).
	aBoard:= Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 2 dice: aDice.
   aGame moveShip.
   aGame moveShip.
   aGame moveShip.
   self assert: aGame winner equals: (aGame ships at: 1).
]

{ #category : 'tests' }
GameTest >> test009AShipCannotMoveAfterAnotherShipWon [

    | aGame aDice aBoard |
	 aDice := OrderedCollection with:(DiceHardcoded withFaces: 10 andValue: 10).
	 aBoard:= Board withTiles: 10.
    aGame := Game withBoard: aBoard ships: 2 dice: aDice.
    aGame moveShip.
    self should: [ aGame moveShip ] raise: Error withExceptionDo: [ :error | self assert: error messageText equals: 'The Game Is Already Over' ].
]

{ #category : 'tests' }
GameTest >> test010CanKnowThePositionOfEachShipWithMultipleShips [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 7 andValue: 3).
	aBoard:= Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 2 dice: aDice.
   aGame moveShip.
   aGame moveShip.
   aGame moveShip.
	self assert: (aGame ships at: 1) position equals: 6.
	self assert: (aGame ships at: 2) position equals: 3.
]

{ #category : 'tests' }
GameTest >> test011TurnsRotateBetweenShips [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 6 andValue: 3).
	aBoard:= Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 2 dice: aDice.
   aGame moveShip.
   aGame moveShip.
	self assert: (aGame ships at: 1) position equals: 3.
	self assert: (aGame ships at: 2) position equals: 3.
]

{ #category : 'tests' }
GameTest >> test012TheWinnerIsTheShipWhoseTurnItWasWhenTheGameEnded [

   | aGame aDice aBoard |
	aDice := OrderedCollection with:(DiceHardcoded withFaces: 10 andValue: 10).
	aBoard:= Board withTiles: 10.
   aGame := Game withBoard: aBoard ships: 2 dice: aDice.
   aGame moveShip.
   self assert: aGame winner equals: (aGame ships at: 1).
]

{ #category : 'tests' }
GameTest >> test013ShipMovesTheSumOfAllDiceRolls [

	| aGame aDice aDice1 aDice2 aBoard |
	aDice:= OrderedCollection new.
	aDice1 := DiceHardcoded withFaces: 9 andValue: 9.
	aDice2 := DiceHardcoded withFaces: 6 andValue: 6.
	aDice add: aDice1.
	aDice add: aDice2.
	aBoard:= Board withTiles: 25.
   aGame := Game withBoard: aBoard ships: 2 dice: aDice.
	aGame moveShip.
	self assert: (aGame ships at: 1) position equals: 15.
]

{ #category : 'tests' }
GameTest >> test014CannotCreateAGameWithEmptyDiceCollection [
    | aGame aBoard |
aBoard := Board withTiles: 10.
    self
        should: [ aGame := Game withBoard: aBoard ships: 1 dice: OrderedCollection new ]
        raise: Error
        withExceptionDo: [ :error |self assert: error messageText equals: 'The Dice Collection Cannot Be Empty' ]
]

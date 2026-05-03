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
GameTest >> test003IfTheTotalOfTilesIs0ThenTheGameIsNotInitialized [
| aGame |
self should: [ aGame:= Game withTiles: 0 ]  raise: Error  withExceptionDo: [ :error | self assert: error messageText equals: 'The Total Of Tiles Cannot Be 0' ]
]

{ #category : 'tests' }
GameTest >> test004ifAPlayerReachesFinalPositionTheGameEnds [

	| aGame |
	aGame := Game withTiles: 1.
	aGame moveShipforward: 1.

	self assert: aGame hasEnded
]

{ #category : 'tests' }
GameTest >> test005aPlayerCannotMoveIfTheGameIsAlreadyOver [

	| aGame |
	aGame := Game withTiles: 1.
	aGame moveShipforward: 1.

	self
		should: [ aGame moveShipforward: 1 ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: error messageText equals: 'The Game Is Already Over' ]
]

{ #category : 'tests' }
GameTest >> test006aPlayerCanMoveVariousTilesAtOnce [

	| aGame |
	aGame := Game withTiles: 10.
	aGame moveShipforward: 11.

	self assert: aGame hasEnded
]

{ #category : 'tests' }
GameTest >> test007aPlayerCanKnowItsPosition [

	| aGame |
	aGame := Game withTiles: 10.
	aGame moveShipforward: 5.

	self assert: (aGame positionOf: 1) equals: 5
]

{ #category : 'tests' }
GameTest >> test008TheWinnerIsTheShipThatCrossedTheEnd [

	| aGame |
	aGame := Game withTiles: 10.
	aGame moveShipforward: 10.
	self assert: aGame winner equals: 1.
]

{ #category : 'tests' }
GameTest >> test009WhenTheGameIsNotOverThereIsNoWinner [

	| aGame |
	aGame := Game withTiles: 10.
	aGame moveShipforward: 3.
	self assert: aGame winner isNil.
]

{ #category : 'tests' }
GameTest >> test010WhenAShipWinsWithMultipleShipsTheGameEnds [

	| aGame |
	aGame := Game withTiles: 10 ships: 2.
	aGame moveShipforward: 10.
	self assert: aGame hasEnded.
]

{ #category : 'tests' }
GameTest >> test011TheWinnerIsTheShipThatCrossedTheEndWithMultipleShips [

	| aGame |
	aGame := Game withTiles: 10 ships: 2.
	aGame moveShipforward: 9.
	aGame moveShipforward: 10.
	self assert: aGame winner equals: 2.
]

{ #category : 'tests' }
GameTest >> test012AShipCannotMoveAfterAnotherShipWon [

	| aGame |
	aGame := Game withTiles: 10 ships: 2.
	aGame moveShipforward: 10.
	self
		should: [ aGame moveShipforward: 5 ]
		raise: Error
		withExceptionDo: [ :e |
		self assert: e messageText equals: 'The Game Is Already Over' ].
]

{ #category : 'tests' }
GameTest >> test013CanKnowThePositionOfEachShipWithMultipleShips [

	| aGame |
	aGame := Game withTiles: 10 ships: 2.
	aGame moveShipforward: 3.
	aGame moveShipforward: 7.
	self assert: (aGame positionOf: 1) equals: 3.
	self assert: (aGame positionOf: 2) equals: 7.
]

{ #category : 'tests' }
GameTest >> test014CannotCreateAGameWithZeroShips [

	| aGame |
	self
		should: [ aGame := Game withTiles: 10 ships: 0 ]
		raise: Error
		withExceptionDo: [ :e |
			self assert: e messageText equals: 'The Ship Count Cannot Be 0' ]
]

{ #category : 'tests' }
GameTest >> test015TurnsRotateBetweenShips [

	| aGame |
	aGame:= Game withTiles: 10 ships: 2.
	aGame moveShipforward: 3.
	aGame moveShipforward: 5.
	self assert: (aGame positionOf: 1) equals: 3.
	self assert: (aGame positionOf: 2) equals: 5
]

{ #category : 'tests' }
GameTest >> test016TheWinnerIsTheShipWhoseTurnItWasWhenTheGameEnded [

	| aGame |
	aGame:= Game withTiles: 10 ships: 2.
	aGame moveShipforward: 10.
	self assert: aGame winner equals: 1.
]

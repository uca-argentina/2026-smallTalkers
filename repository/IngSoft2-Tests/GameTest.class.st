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
aGame moveForward: 1.

self assert: ( aGame hasEnded )


]

{ #category : 'tests' }
GameTest >> test005aPlayerCannotMoveIfTheGameIsAlreadyOver [

| aGame |
aGame := Game withTiles: 1.
aGame moveForward: 1.

self should: [ aGame moveForward: 1 ]  raise: Error  withExceptionDo: [ :error | self assert: error messageText equals: 'The Game Is Already Over' ]

]

{ #category : 'tests' }
GameTest >> test006aPlayerCanMoveVariousTilesAtOnce [

| aGame |
aGame := Game withTiles: 10.
aGame moveForward: 11.

self assert: (aGame hasEnded)
]

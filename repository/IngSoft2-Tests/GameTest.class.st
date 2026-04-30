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

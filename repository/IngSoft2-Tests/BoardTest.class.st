Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> test001whenABoardWithZeroTilesIsCreatedThenThrowError [

self should: [ Board withTiles: 0 ] raise: Error withExceptionDo: [ :error | self assert: error messageText equals: 'Cannot create a board with zero or negative tiles.']
]

{ #category : 'tests' }
BoardTest >> test002whenABoardWithNegativeTilesIsCreatedThenThrowError [

self should: [ Board withTiles: -1 ] raise: Error withExceptionDo: [ :error | self assert: error messageText equals: 'Cannot create a board with zero or negative tiles.' ]
]

{ #category : 'tests' }
BoardTest >> test003aBoardKnowsItsTotalLaps [

| aBoard |

aBoard := Board withTiles: 10.

self assert: aBoard totalLaps equals: 1 

]

{ #category : 'tests' }
BoardTest >> test004aBoardWithMultipleLapsKnowsItsTotalLaps [

| aBoard |

aBoard := Board withTiles: 10 laps: 3.

self assert: aBoard totalLaps equals: 3 

]

{ #category : 'tests' }
BoardTest >> test005WhenABoardWithZeroLapsIsCreatedThenThrowError [

self should: [ Board withTiles: 10 laps: 0 ] raise: Error withExceptionDo: [ :error | self assert: error messageText equals: 'Cannot create a board with zero or negative laps.' ]
]

{ #category : 'tests' }
BoardTest >> test006WhenABoardWithNegativeLapsIsCreatedThenThrowError [

self should: [ Board withTiles: 10 laps: -1 ] raise: Error withExceptionDo: [ :error | self assert: error messageText equals: 'Cannot create a board with zero or negative laps.' ]
]

{ #category : 'tests' }
BoardTest >> test007ABoardKnowsWhenAPositionIsAWinningPosition [

	| aBoard |
	aBoard := Board withTiles: 10 laps: 1.
	self assert: (aBoard isWinningPosition: 1)
]

{ #category : 'tests' }
BoardTest >> test008ABoardKnowsWhenAPositionIsNotAWinningPosition [

	| aBoard |
	aBoard := Board withTiles: 10 laps: 2.
	self deny: (aBoard isWinningPosition: 1)
]

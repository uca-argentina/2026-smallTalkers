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
BoardTest >> test003aBoardKnowsWhenAPositionIsAWinningPosition [

| aBoard |

aBoard := Board withTiles: 10.

self assert: ( aBoard isWinningPosition: 10 )

]

{ #category : 'tests' }
BoardTest >> test004aBoardKnowsWhenAPositionIsNotAWinningPosition [

| aBoard |

aBoard := Board withTiles: 10.

self deny: ( aBoard isWinningPosition: 5 )

]

Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'totalOfTiles'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Board class >> withTiles: aTotalOfTiles [
	aTotalOfTiles <= 0 ifTrue: [ Error signal: 'Cannot create a board with zero or negative tiles.'].
	^ self new initializeWithTiles: aTotalOfTiles.
]

{ #category : 'initialization' }
Board >> initializeWithTiles: aTotalOfTiles [

	totalOfTiles := aTotalOfTiles .
]

{ #category : 'initialization' }
Board >> isWinningPosition: position [

	^ position >= totalOfTiles.
]

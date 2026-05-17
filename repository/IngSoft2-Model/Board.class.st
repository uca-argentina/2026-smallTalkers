Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'totalOfTiles',
		'laps'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Board class >> withTiles: aTotalOfTiles [
	aTotalOfTiles <= 0 ifTrue: [ Error signal: 'Cannot create a board with zero or negative tiles.'].
	^ self new initializeWithTiles: aTotalOfTiles laps: 1.
]

{ #category : 'accessing' }
Board class >> withTiles: aTotalOfTiles laps: aLapCount [
	aTotalOfTiles <= 0 ifTrue: [ Error signal: 'Cannot create a board with zero or negative tiles.'].
	aLapCount <= 0 ifTrue: [ Error signal: 	'Cannot create a board with zero or negative laps.'].
	^ self new initializeWithTiles: aTotalOfTiles laps: aLapCount .
]

{ #category : 'initialization' }
Board >> initializeWithTiles: aTotalOfTiles [

	totalOfTiles := aTotalOfTiles .
]

{ #category : 'initialization' }
Board >> initializeWithTiles: aTotalOfTiles laps: aLapCount [

	totalOfTiles := aTotalOfTiles .
	laps := aLapCount.
]

{ #category : 'initialization' }
Board >> isWinningPosition: aLap [

 ^ aLap >= laps 
]

{ #category : 'initialization' }
Board >> totalLaps [

	^ laps
]

{ #category : 'initialization' }
Board >> totalTiles [
	^ totalOfTiles 
]

Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'totalOfTiles',
		'laps',
		'effects'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Board class >> withTiles: arg1 [

	arg1 <= 0 ifTrue: [
		Error signal: 'Cannot create a board with zero or negative tiles.' ].
	^ self new initializeWithTiles: arg1 laps: 1
]

{ #category : 'accessing' }
Board class >> withTiles: arg1 laps: arg2 [

	arg1 <= 0 ifTrue: [
		Error signal: 'Cannot create a board with zero or negative tiles.' ].
	arg2 <= 0 ifTrue: [
		Error signal: 'Cannot create a board with zero or negative laps.' ].
	^ self new initializeWithTiles: arg1 laps: arg2
]

{ #category : 'accessing' }
Board class >> withTiles: aTotalOfTiles laps: aLapCount effect: anEffect [
	aTotalOfTiles <= 0 ifTrue: [ Error signal: 'Cannot create a board with zero or negative tiles.'].
	aLapCount <= 0 ifTrue: [ Error signal: 	'Cannot create a board with zero or negative laps.'].
	anEffect generateEffectsFor: aTotalOfTiles.
	^ self new initializeWithTiles: aTotalOfTiles laps: aLapCount effects: anEffect.
]

{ #category : 'initialization' }
Board >> effectAt: aPosition [
	effects isEmpty ifTrue: [ ^ NullEffect new ].
	^ effects at: aPosition + 1.
	
]

{ #category : 'initialization' }
Board >> initializeWithTiles: aTotalOfTiles [

	totalOfTiles := aTotalOfTiles .
	laps := 1.
	effects:= OrderedCollection new.
]

{ #category : 'initialization' }
Board >> initializeWithTiles: aTotalOfTiles laps: aLapCount [

	totalOfTiles := aTotalOfTiles .
	laps := aLapCount.
	effects := OrderedCollection new.
]

{ #category : 'initialization' }
Board >> initializeWithTiles: aTotalOfTiles laps: aLapCount effects: anEffect [

	totalOfTiles := aTotalOfTiles .
	laps := aLapCount.
	effects := anEffect.
]

{ #category : 'initialization' }
Board >> isWinningPosition: arg1 [

	^ arg1 >= laps
]

{ #category : 'initialization' }
Board >> totalLaps [

	^ laps
]

{ #category : 'initialization' }
Board >> totalTiles [

	^ totalOfTiles
]

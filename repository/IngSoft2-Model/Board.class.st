Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'totalOfTiles',
		'laps',
		'effects',
		'totalParsecs'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Board class >> withTiles: Tiles [

	Tiles <= 0 ifTrue: [
		Error signal: 'Cannot create a board with zero or negative tiles.' ].
	^ self new initializeWithTiles: Tiles laps: 1
]

{ #category : 'accessing' }
Board class >> withTiles: Tiles laps: Laps [

	Tiles <= 0 ifTrue: [
		Error signal: 'Cannot create a board with zero or negative tiles.' ].
	Laps <= 0 ifTrue: [
		Error signal: 'Cannot create a board with zero or negative laps.' ].
	^ self new initializeWithTiles: Tiles laps: Laps
]

{ #category : 'accessing' }
Board class >> withTiles: aTotalOfTiles laps: aLapCount effects: aCollection [
	aTotalOfTiles <= 0 ifTrue: [ Error signal: 'Cannot create a board with zero or negative tiles.'].
	aLapCount <= 0 ifTrue: [ Error signal: 	'Cannot create a board with zero or negative laps.'].
	^ self new initializeWithTiles: aTotalOfTiles laps: aLapCount effects: aCollection.
]

{ #category : 'accessing' }
Board class >> withTiles: aTotalOfTiles laps: aLapCount effects: aCollection lightyears: aLightyearTotal [
	aTotalOfTiles <= 0 ifTrue: [ Error signal: 'Cannot create a board with zero or negative tiles.' ].
	aLapCount <= 0 ifTrue: [ Error signal: 'Cannot create a board with zero or negative laps.' ].
	aLightyearTotal <= 0 ifTrue: [ Error signal: 'Cannot create a board with zero or negative light-years.' ].
	^ self new initializeWithTiles: aTotalOfTiles laps: aLapCount effects: aCollection parsecs: aLightyearTotal / 3.
]

{ #category : 'accessing' }
Board class >> withTiles: aTotalOfTiles laps: aLapCount effects: aCollection parsecs: aParsecTotal [
	aTotalOfTiles <= 0 ifTrue: [ Error signal: 'Cannot create a board with zero or negative tiles.' ].
	aLapCount <= 0 ifTrue: [ Error signal: 'Cannot create a board with zero or negative laps.' ].
	aParsecTotal <= 0 ifTrue: [ Error signal: 'Cannot create a board with zero or negative parsecs.' ].
	^ self new initializeWithTiles: aTotalOfTiles laps: aLapCount effects: aCollection parsecs: aParsecTotal.
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
	totalParsecs := 0.
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
	totalParsecs := 0.
]

{ #category : 'initialization' }
Board >> initializeWithTiles: aTotalOfTiles laps: aLapCount effects: anEffect parsecs: aParsecTotal [
	totalOfTiles := aTotalOfTiles.
	laps := aLapCount.
	effects := anEffect.
	totalParsecs := aParsecTotal.
]

{ #category : 'initialization' }
Board >> isWinningPosition: arg1 [

	^ arg1 >= laps
]

{ #category : 'initialization' }
Board >> lightyearsToTiles: aLightyears [
	^ self parsecsToTiles: aLightyears / 3
]

{ #category : 'initialization' }
Board >> parsecsToTiles: aParsecs [
	totalParsecs = 0 ifTrue: [ ^ aParsecs ].
	^ (aParsecs * totalOfTiles / totalParsecs) truncated.
]

{ #category : 'initialization' }
Board >> totalLaps [

	^ laps
]

{ #category : 'initialization' }
Board >> totalTiles [

	^ totalOfTiles
]

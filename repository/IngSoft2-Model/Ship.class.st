Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'currentPosition',
		'lapsCompleted',
		'hand'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Ship class >> new [

	^ super new initializeWith: 0
]

{ #category : 'accessing' }
Ship >> completeLap [

	lapsCompleted := lapsCompleted + 1
]

{ #category : 'accessing' }
Ship >> hand [ 
	^ hand 

]

{ #category : 'accessing' }
Ship >> hasCard: aCard [ 
	^ hand includes: aCard

]

{ #category : 'as yet unclassified' }
Ship >> initializeWith: anInteger [
    currentPosition := anInteger.
	 lapsCompleted := 0.
	 hand := OrderedCollection new.
]

{ #category : 'accessing' }
Ship >> isNull [

	^ false
]

{ #category : 'accessing' }
Ship >> laps [

	^ lapsCompleted
]

{ #category : 'accessing' }
Ship >> moveBy: anInteger onBoard: aBoard [ 
	| tiles newPosition |
	tiles := aBoard totalTiles.
	newPosition := currentPosition + anInteger.
 
	newPosition < 0 ifTrue: [
		currentPosition := 0 ]
	ifFalse: [
		lapsCompleted := lapsCompleted + (newPosition // tiles).
		currentPosition := newPosition \\ tiles.
	].

]

{ #category : 'accessing' }
Ship >> moveForward: anInteger [ 
    anInteger <= 0 ifTrue: [ Error signal: 'Cannot move zero or negative squares' ].
    currentPosition := currentPosition + anInteger.
]

{ #category : 'as yet unclassified' }
Ship >> moveForward: anInteger onBoard: aBoard [
    anInteger <= 0 ifTrue: [ Error signal: 'Cannot move zero or negative squares' ].
	self moveBy: anInteger onBoard: aBoard.
]

{ #category : 'accessing' }
Ship >> position [

	^ currentPosition
]

{ #category : 'accessing' }
Ship >> receiveCard: aCard [ 
	hand add: aCard.

]

{ #category : 'accessing' }
Ship >> removeCard: aCard [ 
	hand remove: aCard ifAbsent: [ Error signal: 'Card not in hand' ].

]

{ #category : 'accessing' }
Ship >> resetPosition [
	currentPosition := 0.
]

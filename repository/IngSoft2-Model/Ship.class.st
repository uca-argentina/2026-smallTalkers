Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'currentPosition',
		'lapsCompleted'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Ship class >> new [
	^ super new initializeWith: 0.
]

{ #category : 'accessing' }
Ship >> completeLap [
    lapsCompleted := lapsCompleted + 1
]

{ #category : 'as yet unclassified' }
Ship >> initializeWith: anInteger [
    currentPosition := anInteger.
	 lapsCompleted := 0.
]

{ #category : 'accessing' }
Ship >> isNull [
	^ false.
]

{ #category : 'accessing' }
Ship >> laps [
    ^ lapsCompleted .
]

{ #category : 'as yet unclassified' }
Ship >> moveForward: anInteger [ 
    anInteger <= 0 ifTrue: [ Error signal: 'Cannot move zero or negative squares' ].
    currentPosition := currentPosition + anInteger.
]

{ #category : 'as yet unclassified' }
Ship >> moveForward: anInteger onBoard: aBoard [
    anInteger <= 0 ifTrue: [ Error signal: 'Cannot move zero or negative squares' ].
    currentPosition := currentPosition + anInteger.
    currentPosition >= aBoard totalTiles ifTrue: [
		currentPosition := currentPosition - aBoard totalTiles.
		lapsCompleted := lapsCompleted + 1.
]
]

{ #category : 'accessing' }
Ship >> position [
    ^ currentPosition.
]

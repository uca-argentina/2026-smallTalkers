Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'currentPosition'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Ship class >> new [
	^ super new initializeWith: 0.
]

{ #category : 'as yet unclassified' }
Ship >> initializeWith: anInteger [
    currentPosition := anInteger.
]

{ #category : 'as yet unclassified' }
Ship >> moveForward: anInteger [
    anInteger <= 0 ifTrue: [ Error signal: 'Cannot move zero or negative squares' ].
    currentPosition := currentPosition + anInteger.
]

{ #category : 'accessing' }
Ship >> position [
    ^ currentPosition.
]

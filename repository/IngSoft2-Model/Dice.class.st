Class {
	#name : 'Dice',
	#superclass : 'Object',
	#instVars : [
		'faces'
	],
	#classInstVars : [
		'faces'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Dice class >> default [
	^ self new initializeWith: 3
]

{ #category : 'initialization' }
Dice class >> withFaces: anInteger [
	^ self new initializeWith: anInteger 
]

{ #category : 'as yet unclassified' }
Dice >> initializeWith: anInteger [
	faces := anInteger.
]

{ #category : 'as yet unclassified' }
Dice >> roll [
	^ (1 to: faces) atRandom
]

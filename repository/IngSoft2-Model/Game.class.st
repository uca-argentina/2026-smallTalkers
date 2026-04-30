Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'position',
		'totalOfTiles'
	],
	#classInstVars : [
		'totalOfTiles',
		'position'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Game class >> default [
	^ self new initializeWith: 0 and: 10.
]

{ #category : 'accessing' }
Game class >> withTiles: anInteger [
	anInteger = 0 ifTrue: [ Error signal: 'The Total Of Tiles Cannot Be 0'].
	^ self new initializeWith: 0 and: anInteger 
]

{ #category : 'testing' }
Game >> hasEnded [
 	^ position >= totalOfTiles 
]

{ #category : 'testing' }
Game >> initializeWith: anInteger and: anInteger2 [
	position := anInteger.
	totalOfTiles := anInteger2 
]

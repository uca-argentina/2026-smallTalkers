Class {
	#name : 'MoonWalk',
	#superclass : 'TileEffect',
	#instVars : [
		'n'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
MoonWalk class >> withN: anInteger [

anInteger <= 0 ifTrue: [ Error signal: 'MoonWalk steps must be positive' ].
^ self new initializeWithN: anInteger.
]

{ #category : 'as yet unclassified' }
MoonWalk >> applyTo: aShip in: aGame [

aGame ships do: [ :i | i = aShip ifFalse: [ aGame moveShip: i by: n negated] ]


]

{ #category : 'initialization' }
MoonWalk >> initializeWithN: anInteger [

n := anInteger
]

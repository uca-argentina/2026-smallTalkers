Class {
	#name : 'CardDeckHardcoded',
	#superclass : 'Object',
	#instVars : [
		'cards',
		'currentIndex'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
CardDeckHardcoded class >> withCards: aCollection [ 
	aCollection isEmpty ifTrue: [ Error signal: 'CardDeckHardcoded needs at least one card' ].
	^ self new initializeWithCards: aCollection
]

{ #category : 'as yet unclassified' }
CardDeckHardcoded >> draw [ 
	| card |
	card := cards at: currentIndex.
	currentIndex := (currentIndex rem: cards size) + 1.
	^ card


]

{ #category : 'as yet unclassified' }
CardDeckHardcoded >> initializeWithCards: aCollection [ 
	cards := aCollection asOrderedCollection.
	currentIndex := 1.


]

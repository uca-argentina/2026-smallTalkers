Class {
	#name : 'CardDeck',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
CardDeck class >> new [
	^ super new
]

{ #category : 'drawing' }
CardDeck >> draw [ 
	"Returns a random card with uniform distribution among the 6 card types."
	| roll |
	roll := (1 to: 6) atRandom.
	roll = 1 ifTrue: [ ^ OverloadCard new ].
	roll = 2 ifTrue: [ ^ SpeedCard new ].
	roll = 3 ifTrue: [ ^ AccelerationCard new ].
	roll = 4 ifTrue: [ ^ CancelationCard new ].
	roll = 5 ifTrue: [ ^ RedoCard new ].
	^ RepeatCard new
]

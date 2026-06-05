Class {
	#name : 'DiceHardcoded',
	#superclass : 'Object',
	#instVars : [
		'faces',
		'value'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'initialization' }
DiceHardcoded class >> withFaces: faces andValue: value [
	faces < 3 ifTrue: [ Error signal: 'A dice cannot have less than 3 faces' ].
	value <= 0 ifTrue: [ Error signal: 'The value of the dice cannot be 0 or less' ].
	faces < value ifTrue: [ Error signal: 'The value of the dice cannot exceed the number of faces on the dice' ].
	^ self new initializeWith: faces and: value 
]

{ #category : 'as yet unclassified' }
DiceHardcoded >> initializeWith: anInteger and: anInteger2 [
	faces:= anInteger.
	value := anInteger2.
	 
]

{ #category : 'as yet unclassified' }
DiceHardcoded >> roll [ 
	^ value
]

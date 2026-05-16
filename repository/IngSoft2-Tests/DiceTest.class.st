Class {
	#name : 'DiceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DiceTest >> test001ADiceCannotBeInitializedIfItHasLessThan3Faces [

| aDice |
self should:[aDice:= Dice withFaces: 1] raise: Error  withExceptionDo: [:error | self assert: error messageText equals:'A dice cannot have less than 3 faces']
]

{ #category : 'tests' }
DiceTest >> test002ADiceRollNeverReturnsValueBelowOne [ 
	| aDice results |
	aDice := Dice withFaces: 6.
	results := (1 to: 100) collect: [ :rolls | aDice roll ].
	self assert: (results allSatisfy: [ :roll | roll >= 1 ]).
]

{ #category : 'tests' }
DiceTest >> test003ADiceRollNeverExceedsNumberOfFaces [ 
	| aDice results |
	aDice := Dice withFaces: 6.
	results := (1 to: 100) collect: [ :rolls | aDice roll ].
	self assert: (results allSatisfy: [ :roll | roll <= 6 ]).
]

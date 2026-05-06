Class {
	#name : 'DiceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DiceTest >> test001DiceReturnsNumberInRange [

| resultado aDice |
aDice:= Dice default.
resultado:= aDice roll.

self assert: (resultado between: 1 and: 3 )
]

{ #category : 'tests' }
DiceTest >> test002DiceReturnsNumberInConfigurableRange [

| resultado aDice |
aDice:= Dice withFaces: 6.
resultado:= aDice roll.

self assert: (resultado between: 1 and: 6 )
]

{ #category : 'tests' }
DiceTest >> test003ADiceCannotBeInitializedIfItHasLessThan3Faces [

| aDice |
self should:[aDice:= Dice withFaces: 1] raise: Error  withExceptionDo: [:error | self assert: error messageText equals:'A dice cannot have less than 3 faces']
]

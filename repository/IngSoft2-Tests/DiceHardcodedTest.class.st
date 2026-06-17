Class {
	#name : 'DiceHardcodedTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DiceHardcodedTest >> test001DiceHardCodedAlwaysReturnsTheConfiguredValue [

	| aDiceHardcoded |

	aDiceHardcoded := DiceHardcoded withFaces: 6 andValue: 5.

	self assert: aDiceHardcoded roll equals: 5.
	self assert: aDiceHardcoded roll equals: 5.
	self assert: aDiceHardcoded roll equals: 5.




]

{ #category : 'tests' }
DiceHardcodedTest >> test002ADiceHardCodedCannotBeInitializedIfTheValueExceedsTheNumberOfFaces [ 
	
| aDice |
self should:[aDice:= DiceHardcoded withFaces: 4 andValue: 5] raise: Error  withExceptionDo: [:error | self assert: error messageText equals:'The value of the dice cannot exceed the number of faces on the dice']



]

{ #category : 'tests' }
DiceHardcodedTest >> test003ADiceHardCodedCannotBeInitializedIfTheValueIs0OrLess [
	
| aDice |
self should:[aDice:= DiceHardcoded withFaces: 4 andValue: 0] raise: Error  withExceptionDo: [:error | self assert: error messageText equals:'The value of the dice cannot be 0 or less']



]

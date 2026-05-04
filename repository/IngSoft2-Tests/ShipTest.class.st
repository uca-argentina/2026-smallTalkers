Class {
	#name : 'ShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTest >> test001AShipStartsAtPositionZero [

	| aShip |
	aShip := Ship new.
	self assert: aShip position equals: 0
]

{ #category : 'tests' }
ShipTest >> test002AShipCanMoveForward [

	| aShip |
	aShip := Ship new.
	aShip moveForward: 5.
	self assert: aShip position equals: 5
]

{ #category : 'tests' }
ShipTest >> test003AShipCanMoveForwardMultipleTimes [

	| aShip |
	aShip := Ship new.
	aShip moveForward: 3.
	aShip moveForward: 4.
	self assert: aShip position equals: 7
]

{ #category : 'tests' }
ShipTest >> test004AShipCannotMoveForwardZeroSquares [

	| aShip |
	aShip := Ship new.
	self
		should: [ aShip moveForward: 0 ]
		raise: Error
		withExceptionDo: [ :e |
			self
				assert: e messageText
				equals: 'Cannot move zero or negative squares' ]
]

{ #category : 'tests' }
ShipTest >> test005AShipCannotMoveForwardNegativeSquares [

	| aShip |
	aShip := Ship new.
	self
		should: [ aShip moveForward: -1 ]
		raise: Error
		withExceptionDo: [ :e |
			self
				assert: e messageText
				equals: 'Cannot move zero or negative squares' ]
]

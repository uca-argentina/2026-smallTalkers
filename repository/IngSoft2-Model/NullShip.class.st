Class {
	#name : 'NullShip',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
NullShip >> completeLap [ 

]

{ #category : 'accessing' }
NullShip >> isNull [
	^ true.
]

{ #category : 'accessing' }
NullShip >> laps [ 
^0

]

{ #category : 'accessing' }
NullShip >> moveBy: anInteger onBoard: aBoard [
	"Null Ship no se mueve"
]

{ #category : 'accessing' }
NullShip >> moveForward: anInteger [
	"Null Ship no se mueve"
]

{ #category : 'accessing' }
NullShip >> moveForward: anInteger onBoard: aBoard [
	"Null Ship no se mueve"
]

{ #category : 'accessing' }
NullShip >> position [
	^ 0
]

{ #category : 'accessing' }
NullShip >> resetPosition [

]

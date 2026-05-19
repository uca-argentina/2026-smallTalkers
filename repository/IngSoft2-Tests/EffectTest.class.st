Class {
	#name : 'EffectTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
EffectTest >> test001SpeedUpAdvancesShip4Tiles [

	| aBoard aShip aDice aGame anEffect |
	anEffect := OrderedCollection new.
	1 to: 10 do: [ :i | anEffect add: NullEffect new. ].
	anEffect at: 4 put: SpeedUp new.
	aBoard := Board withTiles: 10 laps: 1 effect: anEffect.
	aShip := OrderedCollection with: Ship new.
	aDice := OrderedCollection with: ( DiceHardcoded withFaces: 3 andValue: 3 ).
	aGame := Game withBoard: aBoard ships: aShip dice: aDice.
	aGame moveShip.
	
self assert: (aGame ships at: 1) position equals: 7
]

{ #category : 'tests' }
EffectTest >> test002SpeedUpDoesNotAffectOtherShips [

	| aBoard aShip aDice aGame anEffect aShip2 |
	anEffect := OrderedCollection new.
	1 to: 10 do: [ :i | anEffect add: NullEffect new. ].
	anEffect at: 4 put: SpeedUp new.
	aBoard := Board withTiles: 10 laps: 1 effect: anEffect.
	aShip := OrderedCollection with: Ship new.
	aShip2:= Ship new. 
	aShip add: aShip2.
	aDice := OrderedCollection with: ( DiceHardcoded withFaces: 3 andValue: 3 ).
	aGame := Game withBoard: aBoard ships: aShip dice: aDice.
	aGame moveShip.
	
self assert: (aGame ships at: 2) position equals: 0
]

{ #category : 'tests' }
EffectTest >> test003WormholeRollsBackAShip4Tiles [

	| aBoard aShip aDice aGame anEffect |
	anEffect := OrderedCollection new.
	1 to: 10 do: [ :i | anEffect add: NullEffect new. ].
	anEffect at: 8 put: Wormhole new.
	aBoard := Board withTiles: 10 laps: 1 effect: anEffect.
	aShip := OrderedCollection with: Ship new.
	aDice := OrderedCollection with: ( DiceHardcoded withFaces: 7 andValue: 7 ).
	aGame := Game withBoard: aBoard ships: aShip dice: aDice.
	aGame moveShip.
	
self assert: (aGame ships at: 1) position equals: 3
]

{ #category : 'tests' }
EffectTest >> test004IfTheGameJustStartedWormholeRollsBackTo0 [

	| aBoard aShip aDice aGame anEffect |
	anEffect := OrderedCollection new.
	1 to: 10 do: [ :i | anEffect add: NullEffect new. ].
	anEffect at: 4 put: Wormhole new.
	aBoard := Board withTiles: 10 laps: 1 effect: anEffect.
	aShip := OrderedCollection with: Ship new.
	aDice := OrderedCollection with: ( DiceHardcoded withFaces: 3 andValue: 3 ).
	aGame := Game withBoard: aBoard ships: aShip dice: aDice.
	aGame moveShip.
	
self assert: (aGame ships at: 1) position equals: 0
]

{ #category : 'tests' }
EffectTest >> test005WormholeDoesNotAffectOtherShips [

	| aBoard aShip aDice aGame anEffect aShip2 |
	anEffect := OrderedCollection new.
	1 to: 10 do: [ :i | anEffect add: NullEffect new. ].
	anEffect at: 4 put: Wormhole new.
	aBoard := Board withTiles: 10 laps: 1 effect: anEffect.
	aShip := OrderedCollection with: Ship new.
	aShip2:= Ship new. 
	aShip add: aShip2.
	aDice := OrderedCollection with: ( DiceHardcoded withFaces: 3 andValue: 3 ).
	aGame := Game withBoard: aBoard ships: aShip dice: aDice.
	aGame moveShip.
	
self assert: (aGame ships at: 2) position equals: 0
]

{ #category : 'tests' }
EffectTest >> test006MoonWalkSendsOtherShipsBackNTiles [

	| aBoard aShip aDice aGame anEffect aShip2 |
	anEffect := OrderedCollection new.
	1 to: 10 do: [ :i | anEffect add: NullEffect new. ].
	anEffect at: 4 put: (MoonWalk withN: 3).
	aBoard := Board withTiles: 10 laps: 1 effect: anEffect.
	aShip := OrderedCollection with: Ship new.
	aShip2:= Ship new. 
	aShip add: aShip2.
	aDice := OrderedCollection with: ( DiceHardcoded withFaces: 3 andValue: 3 ).
	aGame := Game withBoard: aBoard ships: aShip dice: aDice.
	aGame moveShip.
	aGame moveShip.
	aGame moveShip.
	
self assert: (aGame ships at: 2) position equals: 0
]

{ #category : 'tests' }
EffectTest >> test007MoonWalkDoesNotAffectTheShipThatLanded [

	| aBoard aShip aDice aGame anEffect aShip2 |
	anEffect := OrderedCollection new.
	1 to: 10 do: [ :i | anEffect add: NullEffect new. ].
	anEffect at: 8 put: (MoonWalk withN: 3).
	aBoard := Board withTiles: 10 laps: 1 effect: anEffect.
	aShip := OrderedCollection with: Ship new.
	aShip2:= Ship new. 
	aShip add: aShip2.
	aDice := OrderedCollection with: ( DiceHardcoded withFaces: 3 andValue: 3 ).
	aGame := Game withBoard: aBoard ships: aShip dice: aDice.
	aGame moveShip.
	aGame moveShip.
	aGame moveShip.
self assert: (aGame ships at: 1) position equals: 6
]

{ #category : 'tests' }
EffectTest >> test008MoonWalkCannotBeCreatedWithZeroOrNegativeN [
    self
        should: [ MoonWalk withN: 0 ]
        raise: Error
        withExceptionDo: [ :error |
            self assert: error messageText equals: 'MoonWalk steps must be positive' ].

]

{ #category : 'tests' }
EffectTest >> test009MoonWalkCannotBeCreatedWithNegativeN [
    self
        should: [ MoonWalk withN: -1 ]
        raise: Error
        withExceptionDo: [ :error |
            self assert: error messageText equals: 'MoonWalk steps must be positive' ].
]

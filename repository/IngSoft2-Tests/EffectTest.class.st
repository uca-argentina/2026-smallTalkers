Class {
	#name : 'EffectTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
EffectTest >> test001SpeedUpAdvancesShip4Tiles [

    | aBoard aShip aDice aGame aRolls anEffects |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.70 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    aShip := OrderedCollection with: Ship new.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

    self assert: (aGame ships at: 1) position equals: 7
]

{ #category : 'tests' }
EffectTest >> test002SpeedUpDoesNotAffectOtherShips [

    | aBoard aShip aDice aGame aShip2 aRolls anEffects |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.70 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    aShip := OrderedCollection with: Ship new.
    aShip2 := Ship new.
    aShip add: aShip2.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

    self assert: (aGame ships at: 2) position equals: 0
]

{ #category : 'tests' }
EffectTest >> test003WormholeRollsBackAShip4Tiles [

    | aBoard aShip aDice aGame aRolls anEffects |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 8
            ifTrue: [ aRolls add: 0.50 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    aShip := OrderedCollection with: Ship new.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 7 andValue: 7).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

    self assert: (aGame ships at: 1) position equals: 3
]

{ #category : 'tests' }
EffectTest >> test004IfTheGameJustStartedWormholeRollsBackTo0 [

    | aBoard aShip aDice aGame aRolls anEffects |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.50 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    aShip := OrderedCollection with: Ship new.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

    self assert: (aGame ships at: 1) position equals: 0
]

{ #category : 'tests' }
EffectTest >> test005WormholeDoesNotAffectOtherShips [

    | aBoard aShip aDice aGame aShip2 aRolls anEffects |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.50 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    aShip := OrderedCollection with: Ship new.
    aShip2 := Ship new.
    aShip add: aShip2.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

    self assert: (aGame ships at: 2) position equals: 0
]

{ #category : 'tests' }
EffectTest >> test006MoonWalkSendsOtherShipsBackNTiles [

    | aBoard aShip aDice aGame aShip2 aRolls aSteps anEffects |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.85 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    aSteps := OrderedCollection with: 3.
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: aSteps parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    aShip := OrderedCollection with: Ship new.
    aShip2 := Ship new.
    aShip add: aShip2.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.
    aGame moveShip.
    aGame moveShip.

    self assert: (aGame ships at: 2) position equals: 0
]

{ #category : 'tests' }
EffectTest >> test007MoonWalkDoesNotAffectTheShipThatLanded [

    | aBoard aShip aDice aGame aShip2 aRolls aSteps anEffects |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 8
            ifTrue: [ aRolls add: 0.85 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    aSteps := OrderedCollection with: 3.
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: aSteps parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    aShip := OrderedCollection with: Ship new.
    aShip2 := Ship new.
    aShip add: aShip2.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
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

{ #category : 'tests' }
EffectTest >> test010HyperJumpUsesFirstValueOnFirstLanding [

    | aBoard aShip aDice aGame aRolls aParsecs anEffects |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.95 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
	aParsecs := OrderedCollection 
    with: (OrderedCollection with: 5 with: 2 with: 1)
    with: (OrderedCollection with: 2 with: 1)
    with: (OrderedCollection with: 1).
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: aParsecs) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    aShip := OrderedCollection with: Ship new.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

    self assert: (aGame ships at: 1) position equals: 8
]

{ #category : 'tests' }
EffectTest >> test011HyperJumpUsesSecondParsecValueInSecondLanding [

    | aBoard aShip aDice aGame aShip2 aRolls aParsecs anEffects |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.95 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
	aParsecs := OrderedCollection 
    with: (OrderedCollection with: 5 with: 2 with: 1)
    with: (OrderedCollection with: 2 with: 1)
    with: (OrderedCollection with: 1).
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: aParsecs) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    aShip := OrderedCollection with: Ship new.
    aShip2 := Ship new.
    aShip add: aShip2.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.
    aGame moveShip.

    self assert: (aGame ships at: 2) position equals: 5
]

{ #category : 'tests' }
EffectTest >> test012HyperJumpCannotBeCreatedWithEmptyParsecs [
    self
        should: [ HyperJump withParsecs: #() ]
        raise: Error
        withExceptionDo: [ :error |
            self assert: error messageText equals: 'Hyperjump needs at least one parsec value' ].
]

{ #category : 'tests' }
EffectTest >> test013AtomicBombWorksFor1Ship [

    | aBoard aShip aDice aGame aRolls anEffects |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.99 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    aShip := OrderedCollection with: Ship new.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

    self assert: (aGame ships at: 1) position equals: 0.
]

{ #category : 'tests' }
EffectTest >> test014AtomicBombWorksForMultipleShips [

    | aBoard aShip aDice aGame aRolls aShip1 anEffects |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.99 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    aShip := OrderedCollection with: Ship new.
    aShip1 := Ship new.
    aShip add: aShip1.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

    self assert: (aGame ships at: 1) position equals: 0.
    self assert: (aGame ships at: 2) position equals: 0.
]

{ #category : 'tests' }
EffectTest >> test015AtomicBombPreservesLaps [

    | aBoard aShip aDice aGame aRolls anEffects |
    aRolls := OrderedCollection new.
    1 to: 5 do: [ :i |
        i = 3
            ifTrue: [ aRolls add: 0.99 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 5.
	aBoard := Board withTiles: 5 laps: 2 effects: anEffects.
    aShip := OrderedCollection with: Ship new.

	aDice := OrderedCollection with: (DiceHardcoded withFaces: 7 andValue: 7).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

    self assert: (aGame ships at: 1) laps equals: 1.
]

Class {
	#name : 'EffectTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
EffectTest >> test001SpeedUpAdvancesShip4Tiles [

    | aBoard aShip aDice aGame aRolls anEffects ship1 |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.70 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    ship1 := Ship new.
    aShip := OrderedCollection with: ship1.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

    self assert: (aGame positionOf: ship1) equals: 7
]

{ #category : 'tests' }
EffectTest >> test002SpeedUpDoesNotAffectOtherShips [

    | aBoard aShip aDice aGame ship2 aRolls anEffects ship1 |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.70 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
   	 ship1 := Ship new.
    ship2 := Ship new.
    aShip := OrderedCollection with: ship1.
    aShip add: ship2.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

   self assert: (aGame positionOf: ship2) equals: 0
]

{ #category : 'tests' }
EffectTest >> test003WormholeRollsBackAShip4Tiles [

    | aBoard aShip aDice aGame aRolls anEffects ship1 |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 8
            ifTrue: [ aRolls add: 0.50 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    ship1 := Ship new.
    aShip := OrderedCollection with: ship1.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 7 andValue: 7).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

     self assert: (aGame positionOf: ship1) equals: 3
]

{ #category : 'tests' }
EffectTest >> test004IfTheGameJustStartedWormholeRollsBackTo0 [

    | aBoard aShip aDice aGame anEffect aRolls ship1 |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.50 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffect := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffect.
    ship1 := Ship new.
    aShip := OrderedCollection with: ship1.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

     self assert: (aGame positionOf: ship1) equals: 0
]

{ #category : 'tests' }
EffectTest >> test005WormholeDoesNotAffectOtherShips [

   | aBoard aShip aDice aGame anEffect ship2 aRolls ship1 |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.50 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffect := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffect.
	 ship1 := Ship new.
	 aShip := OrderedCollection with: ship1.
    ship2 := Ship new.
    aShip add: ship2.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

    self assert: (aGame positionOf: ship2) equals: 0
]

{ #category : 'tests' }
EffectTest >> test006MoonWalkSendsOtherShipsBackNTiles [

   | aBoard aShip aDice aGame anEffect ship2 aRolls ship1 aSteps|
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.85 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    aSteps := OrderedCollection with: 3.
    anEffect := (EffectDistributorHardcoded withRolls: aRolls steps: aSteps parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffect.
	 ship1 := Ship new.
    aShip := OrderedCollection with: ship1 .
    ship2 := Ship new.
    aShip add: ship2.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.
    aGame moveShip.
    aGame moveShip.

    self assert: (aGame positionOf: ship2) equals: 0
]

{ #category : 'tests' }
EffectTest >> test007MoonWalkDoesNotAffectTheShipThatLanded| aBoard [ aShip aDice aGame anEffect aShip2 aRolls aSteps ship1 |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 8
            ifTrue: [ aRolls add: 0.85 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    aSteps := OrderedCollection with: 3.
    anEffect := (EffectDistributorHardcoded withRolls: aRolls steps: aSteps parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffect.
    ship1 := Ship new.
    aShip2 := Ship new.
    aShip := OrderedCollection with: ship1.
    aShip add: aShip2.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.
    aGame moveShip.
    aGame moveShip.
 
    self assert: (aGame positionOf: ship1) equals: 6
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

    | aBoard aShip aDice aGame aRolls aParsecs anEffects ship1 |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.95 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
	 aParsecs := OrderedCollection with: (OrderedCollection with: 5 with: 2 with: 1).
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: aParsecs) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    ship1 := Ship new.
    aShip := OrderedCollection with: ship1.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.

    self assert: (aGame positionOf: ship1) equals: 8
]

{ #category : 'tests' }
EffectTest >> test011HyperJumpUsesSecondParsecValueInSecondLanding [

    | aBoard aShip aDice aGame aShip2 aRolls aParsecs anEffects ship1 |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.95 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
	aParsecs := OrderedCollection 
    with: (OrderedCollection with: 5 with: 2 with: 1).
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: aParsecs) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffects.
    ship1 := Ship new.
    aShip := OrderedCollection with: ship1.
    aShip2 := Ship new.
    aShip add: aShip2.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.
    aGame moveShip.

    self assert: (aGame positionOf: aShip2) equals: 5
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

  | aBoard aShip aDice aGame anEffect aRolls ship1 |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.99 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffect := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffect.
    ship1 := Ship new.
    aShip := OrderedCollection with: ship1.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.
 
    self assert: (aGame positionOf: ship1) equals: 0.
]

{ #category : 'tests' }
EffectTest >> test014AtomicBombWorksForMultipleShips [

    | aBoard aShip aDice aGame anEffect aShip1 aRolls ship0 |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        i = 4
            ifTrue: [ aRolls add: 0.99 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffect := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 1 effects: anEffect.
    ship0 := Ship new.
    aShip1 := Ship new.
    aShip := OrderedCollection with: ship0.
    aShip add: aShip1.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 3 andValue: 3).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.
 
    self assert: (aGame positionOf: ship0) equals: 0.
    self assert: (aGame positionOf: aShip1) equals: 0.
]

{ #category : 'tests' }
EffectTest >> test015AtomicBombPreservesLaps [

| aBoard aShip aDice aGame anEffect aRolls ship1 |
    aRolls := OrderedCollection new.
    1 to: 5 do: [ :i |
        i = 3
            ifTrue: [ aRolls add: 0.99 ]
            ifFalse: [ aRolls add: 0.10 ]
    ].
    anEffect := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.
    aBoard := Board withTiles: 4 laps: 1 effects: anEffect.
    ship1 := Ship new.
    aShip := OrderedCollection with: ship1.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 4 andValue: 4).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.
 
    self assert: (aGame lapsOf: ship1) equals: 1.
]

{ #category : 'tests' }
EffectTest >> test016LandingOnEffectTileByEffectDoesNotChainEffects [ 
 
    | aBoard aShip aDice aGame anEffect aRolls ship1 |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i |
        (i = 5) "casillero 4 (índice base-0): SpeedUp"
            ifTrue:  [ aRolls add: 0.70 ]
        ifFalse: [
        (i = 9) "casillero 8 (índice base-0): Wormhole"
            ifTrue:  [ aRolls add: 0.50 ]
            ifFalse: [ aRolls add: 0.10 ] ]
    ].
    anEffect := (EffectDistributorHardcoded
        withRolls: aRolls
        steps: OrderedCollection new
        parsecs: OrderedCollection new)
        generateEffectsFor: 10.
    aBoard := Board withTiles: 10 laps: 2 effects: anEffect.
    ship1 := Ship new.
    aShip := OrderedCollection with: ship1.
    aDice := OrderedCollection with: (DiceHardcoded withFaces: 4 andValue: 4).
    aGame := Game withBoard: aBoard ships: aShip dice: aDice.
    aGame moveShip.
 
    self assert: (aGame positionOf: ship1) equals: 8
]

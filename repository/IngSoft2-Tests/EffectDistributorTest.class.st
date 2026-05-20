Class {
	#name : 'EffectDistributorTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
EffectDistributorTest >> test001EffectDistributorGeneratesNullEffect [ 

    | aRolls anEffects |
    aRolls := OrderedCollection with: 0.10.
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new)generateEffectsFor: 1.

    self assert: ((anEffects at: 1) isKindOf: NullEffect).

]

{ #category : 'tests' }
EffectDistributorTest >> test002EffectDistributorGeneratesWormhole [ 

    | aRolls anEffects |
    aRolls := OrderedCollection with: 0.50.
 	 anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new)generateEffectsFor: 1.
    self assert: ((anEffects at: 1) isKindOf: Wormhole ).

]

{ #category : 'tests' }
EffectDistributorTest >> test003EffectDistributorGeneratesSpeedUp [ 

    | aRolls anEffects |
    aRolls := OrderedCollection with: 0.70.
   	 anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new)generateEffectsFor: 1.

    self assert: ((anEffects at: 1) isKindOf: SpeedUp ).

]

{ #category : 'tests' }
EffectDistributorTest >> test004EffectDistributorGeneratesMoonWalk [ 

    | aRolls anEffects |
    aRolls := OrderedCollection with: 0.85.
	 anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: (OrderedCollection with: 3) parsecs: OrderedCollection new)generateEffectsFor: 1.

    self assert: ((anEffects at: 1) isKindOf: MoonWalk ).

]

{ #category : 'tests' }
EffectDistributorTest >> test005EffectDistributorGeneratesHyperJump [ 

    | aRolls anEffects aParsecs |
    aRolls := OrderedCollection with: 0.95.
    aParsecs := OrderedCollection with: #(5 2 1).
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: aParsecs) generateEffectsFor: 1.

    self assert: ((anEffects at: 1) isKindOf: HyperJump).

]

{ #category : 'tests' }
EffectDistributorTest >> test006EffectDistributorGeneratesAtomicBomb [ 

    | aRolls anEffects |
    aRolls := OrderedCollection with: 0.99.
 	 anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new)generateEffectsFor: 1.

    self assert: ((anEffects at: 1) isKindOf: AtomicBomb ).

]

{ #category : 'tests' }
EffectDistributorTest >> test007EffectDistributorGeneratesCorrectAmountOfEffects [ 

    | aRolls anEffects |
    aRolls := OrderedCollection new.
    1 to: 10 do: [ :i | aRolls add: 0.10 ].
    anEffects := (EffectDistributorHardcoded withRolls: aRolls steps: OrderedCollection new parsecs: OrderedCollection new) generateEffectsFor: 10.

    self assert: anEffects size equals: 10.


]

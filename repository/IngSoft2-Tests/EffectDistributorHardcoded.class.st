Class {
	#name : 'EffectDistributorHardcoded',
	#superclass : 'Object',
	#instVars : [
		'rolls',
		'steps',
		'parsecs'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
EffectDistributorHardcoded class >> withRolls: aRollsCollection steps: aStepsCollection parsecs: aParsecCollection [ 
    ^ self new initializeWithRolls: aRollsCollection steps: aStepsCollection parsecs: aParsecCollection
]

{ #category : 'initialization' }
EffectDistributorHardcoded >> generateEffectsFor: totalTiles [ 
    | effects stepsIndex parsecsIndex |
    effects := OrderedCollection new.
    stepsIndex := 1.
    parsecsIndex := 1.
    
    rolls do: [ :roll |
        | effect |
        effect := self pickEffectForRoll: roll stepsIndex: stepsIndex parsecsIndex: parsecsIndex.
        effects add: effect.
        (roll >= 0.80 and: [ roll < 0.90 ]) ifTrue: [ stepsIndex := stepsIndex + 1 ].
        (roll >= 0.90 and: [ roll < 0.98 ]) ifTrue: [ parsecsIndex := parsecsIndex + 1 ].
    ].
    
    ^ effects

]

{ #category : 'initialization' }
EffectDistributorHardcoded >> initializeWithRolls: aRollsCollection steps: aStepsCollection parsecs: aParsecCollection [ 
    rolls := aRollsCollection.
    steps := aStepsCollection.
    parsecs := aParsecCollection.
]

{ #category : 'initialization' }
EffectDistributorHardcoded >> pickEffectForRoll: roll stepsIndex: stepsIndex parsecsIndex: parsecsIndex [ 
    roll < 0.30 ifTrue: [ ^ NullEffect new ].
    roll < 0.50 ifTrue: [ ^ Wormhole new ].
    roll < 0.70 ifTrue: [ ^ SpeedUp new ].
    roll < 0.80 ifTrue: [ ^ MoonWalk withN: (steps at: stepsIndex) ].
    roll < 0.88 ifTrue: [ ^ HyperJump withParsecs: (parsecs at: parsecsIndex) ].
	 roll < 0.98 ifTrue: [ ^ CardTile new ].
    ^ AtomicBomb new

]

Class {
	#name : 'EffectDistributor',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
EffectDistributor class >> generateEffectsFor: totalTiles stepsPool: aStepsPool parsecsPool: aParsecPool [ 
    | effects random |
    effects := OrderedCollection new.
    random := Random new.
    
    totalTiles timesRepeat: [
        effects add: (self pickEffectWith: random stepsPool: aStepsPool parsecsPool: aParsecPool)
    ].
    
    ^ effects
]

{ #category : 'as yet unclassified' }
EffectDistributor class >> pickEffectWith: aRandom stepsPool: aStepsPool parsecsPool: aParsecPool [ 
    | roll |
    roll := aRandom next.
    
    roll < 0.40 ifTrue: [ ^ NullEffect new ].
    roll < 0.60 ifTrue: [ ^ Wormhole new ].
    roll < 0.80 ifTrue: [ ^ SpeedUp new ].
    roll < 0.90 ifTrue: [ ^ MoonWalk withN: (aStepsPool atRandom: aRandom) ].
    roll < 0.98 ifTrue: [ ^ HyperJump withParsecs: (aParsecPool atRandom: aRandom) ].
    ^ AtomicBomb new
]

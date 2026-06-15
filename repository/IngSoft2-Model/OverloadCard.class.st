Class {
	#name : 'OverloadCard',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
OverloadCard >> applyEffectTo: aRoll for: aShip [
	^ aRoll - 2
]

{ #category : 'testing' }
OverloadCard >> isPermanent [
	^ true.
]

{ #category : 'as yet unclassified' }
OverloadCard >> play: aShip in: aGame target: aTargetShip [
	aGame hasEnded ifTrue: [ Error signal: 'The Game Is Already Over' ].
	aGame addPermanentCard: self target: aTargetShip.
]

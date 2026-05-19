Class {
	#name : 'AtomicBomb',
	#superclass : 'TileEffect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
AtomicBomb >> applyTo: aShip in: aGame [

aGame ships do: [ :i | i resetPosition ]


]

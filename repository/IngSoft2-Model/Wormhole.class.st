Class {
	#name : 'Wormhole',
	#superclass : 'TileEffect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Wormhole >> applyTo: aShip in: aGame [

aGame moveShip: aShip by: -4.


]

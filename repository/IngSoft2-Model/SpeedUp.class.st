Class {
	#name : 'SpeedUp',
	#superclass : 'TileEffect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
SpeedUp >> applyTo: aShip in: aGame [

aGame moveShip: aShip by: 4.


]

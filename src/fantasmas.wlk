import wollok.game.*
import pacman.*


class Fantasma {

	var property image
	var property nombre
	var property position
	var previousPosition = position
	
	method resetPosition(){
		
		position = game.center()
	}
	
	method acercarseA(pacman){
		
		var otraPosicion = pacman.position()
		var newX = position.x() + if(otraPosicion.x() > position.x()) 1 else -1
		var newY = position.y() +  if(otraPosicion.y() > position.y()) 1 else -1
		
		//EVITAR QUE SE POSICIONEN FUERA DEL TABLERO
		
		newX = newX.max(0).min(game.width() - 1)
		newY = newY.max(0).min(game.height() - 1)
		
		previousPosition = position
		position = game.at(newX, newY)
		
	}
	
	method chocarCon(otro){
		
		self.resetPreviousPosition()
	}
	
	method resetPreviousPosition() {
		position = previousPosition 
	}
    
}
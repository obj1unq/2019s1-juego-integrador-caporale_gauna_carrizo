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
	method esTraspasable() {
		return true
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
    
    method comer(comida){}
    method convertirAComida(){
    	//cambie la imagen a violeta
    	//hulla del pacman
    	//si choca con el pacman ; le sume puntos al pacman y desaparesca la imagen (se puede hacer 
    	// que quede la imagen de los ojitos y que vuelva al centro y ahi cambie la imagen a su color original)
    	
    }
}
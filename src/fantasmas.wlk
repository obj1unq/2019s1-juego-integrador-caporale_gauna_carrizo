import wollok.game.*
import pacman.*


class Fantasma {
	var property imagenOriginal
	var property image
	var property nombre
	var property position
	var previousPosition = position
	var property puntosAlSerComido=200
	var property fantasmaMalo = true  // indentifica conduta de pacman 
	
	method transformar() { 
		if (self.fantasmaMalo()){
			self.image("fantasmaAzul.png")
			fantasmaMalo = not fantasmaMalo
		}else {
			self.image(imagenOriginal)
			fantasmaMalo = not fantasmaMalo
		}
	}
	method transformarSiEsMalo() {
		if (self.fantasmaMalo()){
			self.transformar()
		}
	}
	
	method resetPosition(){
		
		position = game.center()
	}
	method esTraspasable() {
		return true
	}
	
	// se agrega metodo para identificar acciones del fantasma segun si es "bueno" o "malo"
	
	method acercarseOAlejarse(pacman){
		
		if(fantasmaMalo){ self.acercarseA(pacman)}
		else {
			
			self.huirDe(pacman)
		}
		}
	//
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

	
	// se agrega metodo huir de Pacman
	
	method huirDe(pacman){
		var otraPosicion = pacman.position()
		var newX = position.x() + if(otraPosicion.x() > position.x()) -1 else 1
		var newY = position.y() +  if(otraPosicion.y() > position.y()) -1 else 1
		
		// evita quedar fuera del tablero
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
import wollok.game.*
import pacman.*
import pared.*


class Fantasma {
	var property imagenOriginal
	var property image
	var property nombre
	var property position
	var previousPosition = position
	var property puntosAlSerComida=200
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
			self.volverDespuesDeUnTiempo()
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
		
		if(fantasmaMalo){ self.acercarseA(pacman)
		  }else{
			self.huirDe(pacman)
			}
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

	
	method huirDe(pacman){
		var otraPosicion = pacman.position()
		var newX = position.x() + if(otraPosicion.x() > position.x()) -1 else 1
		var newY = position.y() +  if(otraPosicion.y() > position.y()) -1 else 1
		

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
    
    method chocasteConPacman(pacman, listaFantasmas){
    	
    	if (self.fantasmaMalo()) {
			pacman.perderVidaSi()
		} else {
			pacman.sumarPuntos(self)
			self.resetPosition()
			self.transformar()
		}
	}
	
	
	method volverAMalo(){
		self.image(imagenOriginal)
		self.fantasmaMalo(true)
	}
	
	method volverDespuesDeUnTiempo(){
	    game.onTick(8000, "transformarseEnMalos", { 
  		self.volverAMalo()})

	}
	
	
}
        
  class FantasmaAleatorio inherits Fantasma{
 	
 	override method acercarseA(pacman){
		
		var newX = 1.randomUpTo(18)
		var newY = 1.randomUpTo(8)
		
		newX = newX.max(1).min(game.width() - 2)
		newY = newY.max(1).min(game.height() - 2)
		
		previousPosition = position
		position = game.at(newX, newY)
		
	}    
 }   

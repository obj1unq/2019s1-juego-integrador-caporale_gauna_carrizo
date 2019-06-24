import pacman.*
import fantasmas.*
import wollok.game.*

class Comidas{
	var property position
	var property image
	

	method desaparecer(){
		game.removeVisual(self)
	}
	method esTraspasable() {
		return true
	}
	method chocarCon(algo){}
	
	method chocasteConPacman(pacman, listaFantasmas){
		
		self.desaparecer()
		pacman.sumarPuntos(self)
		
		
	}
	
}
class Cereza inherits Comidas{

  method puntosAlSerComida() = 400
	
}

class Pera inherits Comidas{
	
	
	method puntosAlSerComida() = 200
}

 class Bolitas inherits Comidas{

 	    var numero
        
 	     
 	constructor(_numero, _position){
 		
 		image = "bolita.png"
 		numero = _numero
 		position = _position
 		game.addVisual(self)
 	}
 	
 	override method chocasteConPacman(pacman, listaFantasmas){
 		super(pacman, listaFantasmas)
		pacman.comerBolita()
 	}
	
	 method puntosAlSerComida() = 40
	
}
	
	
 class BolaMagica inherits Comidas{
	
	
	override method chocasteConPacman(_pacman,listaFantasmas){
		
		self.desaparecer()
		listaFantasmas.forEach{fantasma => fantasma.transformarSiEsMalo()}
		_pacman.sumarPuntos(self)
		
	}

	
	
	
	method puntosAlSerComida() = 90
 
   
  }
	


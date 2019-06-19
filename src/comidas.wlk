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
 		
 		self.desaparecer()
		pacman.sumarPuntos(self)
		pacman.comerBolita()
 	}
	
	 method puntosAlSerComida() = 50
	
}
	/* var numero = 0
	var fila = self.verQueFila() 
	var listaDePosiciones = (0..game.width()).map({x =>  new Position(x, fila)})
	constructor(_numero){
	 
	 numero = _numero
	 position = listaDePosiciones.get(_numero)	
		
	}
	
	override method image() = "pera.png"
	
	method verQueFila(){
		
	return if (numero.between(0,19)){ 0 }
		
    else if(numero.between(20,39)){ 1 }
    
    else if(numero.between(40,59)){ 2 }
    
    else if(numero.between(60,79)){ 3 }
      	
    else if(numero.between(80,99)){ 4 }
    
    else if(numero.between(100,119)){ 5 }
    
    else if(numero.between(120,139)){ 6 }
    
    else if(numero.between(140,159)){ 7 }
    	
    else if(numero.between(160,179)){ 8 }
    
    else { 9 }
  
	}
	
	*/
	
 class BolaMagica inherits Comidas{
	
	
	override method chocasteConPacman(_pacman,listaFantasmas){
		
		self.desaparecer()
		listaFantasmas.forEach{fantasma => fantasma.transformarSiEsMalo()}
		_pacman.sumarPuntos(self)
		
	}
	
	method puntosAlSerComida() = 90
 
   
  }
	

	

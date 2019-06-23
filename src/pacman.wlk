import wollok.game.*
import fantasmas.*
import comidas.*
import orientacionPacman.*
import final.*

object pacman {

	var property puntos = 0
	var orientacion = arriba
	var property image = orientacion.image()
	var property position = game.origin()
	//var property position = game.at(0,1)
	var vidas = 3
	var property bolitasQueComio = 0
	
	method comerBolita(){
		
	  bolitasQueComio += 1
      if( self.juegoTerminado()){
      	game.clear()
      	game.addVisualIn(ganaste,game.center())
      	
      }
	}

	method perderVidaSi() {
		self.perderVida()
		if (not self.juegoTerminado()) {
			self.resetPosition()
			game.say(self,"perdiste una vida")
		} else {
			game.say(self,"perdiste el juego")
			game.clear()
			game.addVisualIn(perdiste,game.center())
			 
			
		}
	}
	
	method perderVida() {
		vidas -= 1
	}
			

	method juegoTerminado() {
		return vidas == 0 or self.gano()
	}
	
	method gano(){
		return self.bolitasQueComio()==200
	}
	
	

	method sumarPuntos(comida) {
		puntos += comida.puntosAlSerComida()
		
	}

	// direcciones
	
	method mover(direccion){
		orientacion=direccion
		orientacion.mover(self)
	}

    //reset posicion del pacman cuando choca con un fantasma malo
	method resetPosition() {
		//position = game.origin()
		position= game.at(1,1)
	}
	
		method chocarCon(fantasma){
		
	}
	
	method objetosEnLaPosicion(_posicion) {    //quienusa esto!!
		game.getObjectsIn(_posicion)
	}
	

	
	

}





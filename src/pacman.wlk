import wollok.game.*
import fantasmas.*
import comidas.*
import orientacionPacman.*
import final.*
import pared.*

object pacman {

	var property puntos = 0
	var orientacion = arriba
	var property image = orientacion.image()
	//var property position = game.origin()
	var property position = game.at(1,1)
	var vidas = 3
	var property bolitasQueComio = 0
	// se agrega para pared
	var previousPosition = position
	
	method comerBolita(){
	  bolitasQueComio += 1
      if( self.juegoTerminado()){
      	self.finalizarJuego()
      	}
	}

	method perderVidaSi() {
		self.perderVida()
		if (not self.juegoTerminado()) {
			self.resetPosition()
			game.say(self,"perdiste una vida")
		} else {
			game.say(self,"perdiste el juego")
			self.finalizarJuego()	
		}
	}
	
	method perderVida() {
		vidas -= 1
	}
			

	method juegoTerminado() {
		return vidas == 0 or self.gano()
	}
	method finalizarJuego() {
		if (vidas == 0){
			game.clear()
			game.addVisualIn(perdiste,game.origin())
			game.onTick(3000, "FIN", {game.stop()})
		}else {
			game.clear()
			game.addVisualIn(ganaste,game.origin())
			game.onTick(3000, "FIN", {game.stop()})
		}
	}
	
	method gano(){
		return self.bolitasQueComio()==144
	}
	
	

	method sumarPuntos(comida) {
		puntos += comida.puntosAlSerComida()
		
	}

	// direcciones
	
	method mover(direccion){
		orientacion=direccion
		previousPosition = self.position()
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
	
	// choca con pared
	
	
		
	method chocasteConPared(){
		self.resetPreviousPosition()
	}
	
	method resetPreviousPosition(){
		position = previousPosition
	}
	

	
	

}





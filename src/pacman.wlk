import wollok.game.*
import fantasmas.*

object pacman {
	var property puntos = 0
	var property image = "pacman.png"
	var property position = game.origin()
	var vidas = 3

// Si no sale del tablero se mueve arriba
	method moverArriba() {
		if (self.position().up(1).y() < game.height()) {
			self.position(self.position().up(1))
			self.image("pacmanBocaArriba.png")
		}
	}
// Si no sale del tablero se mueve abajo
	method moverAbajo() {
		if (self.position().down(1).y() >= 0) {
			self.position(self.position().down(1))
			self.image("pacmanBocaAbajo.png")
		}
	}
// Si no sale del tablero se mueve a la derecha
	method moverDerecha() {
		if (self.position().right(1).x() < game.width()) {
			self.position(self.position().right(1))
			self.image("pacman.png")
		}	
	}
// Si no sale del tablero se mueve a la izquierda
	method moverIzquierda() {
		if (self.position().left(1).x() >= 0) {
			self.position(self.position().left(1))
			self.image("pacmanIzquierda.png")
		}
	}
	
	method perderVida() {
		vidas-= 1
		
	}
	
	method resetPosition(){
		
		position = game.origin()
	}
	
	method chocarCon(fantasma){
		self.perderVida()
		if (self.juegoTerminado()) {
			game.stop()
		}
		else {
			self.resetPosition()
			fantasma.resetPosition()
		}
	}
	
	method juegoTerminado(){
		
		return vidas == 0
	}
	method comer(comida){
		puntos += comida.puntosAlSerComida()
		comida.desaparecer()
	}

}
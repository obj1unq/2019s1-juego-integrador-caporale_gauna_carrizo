import wollok.game.*
import fantasmas.*
import comidas.*
import bolitas.*

object pacman {

	var property puntos = 0
	var property image = "pacman.png"
	var property position = game.origin()
	var vidas = 3
	var property bolitasQueComio = 0
	
	method comerBolita(){
		
	  bolitasQueComio += 1
      if( self.juegoTerminado()){
      	
      	game.stop()
      }
	}

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
		vidas -= 1
	}

	method resetPosition() {
		position = game.origin()
	}

	method perderVidaSi() {
		self.perderVida()
		if (not self.juegoTerminado()) {
			self.resetPosition()
		} else {
			game.stop()
		}
	}

	/*method chocarCon(fantasma) {
		if (fantasma.fantasmaMalo()) {
			self.perderVidaSi()
		} else {
			puntos += fantasma.puntosAlSerComido()
			fantasma.resetPosition()
			fantasma.transformar()
		}
	}*/

	method juegoTerminado() {
		return vidas == 0 or self.bolitasQueComio() == 200
	}

	method sumarPuntos(comida) {
		puntos += comida.puntosAlSerComida()
		
	}

	method objetosEnLaPosicion(_posicion) {
		game.getObjectsIn(_posicion)
	}

	//
	/*method comeBolitaMagica(bolaMagica, fantasmas) {
		bolaMagica.desaparecer()
		fantasmas.forEach({ fantasma => fantasma.transformarSiEsMalo()})
	}*/

}


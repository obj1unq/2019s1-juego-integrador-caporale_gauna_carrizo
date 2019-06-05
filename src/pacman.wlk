import wollok.game.*
import fantasmas.*

object pacman {
	var property image = "pacman.png"
	var property position = game.origin()
	var vidas = 3

	method perderVida() {
		vidas-= 1
		position = game.origin()	
	}
	
	method juegoTerminado(){
		
		return vidas == 0
	}
}
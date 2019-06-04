import wollok.game.*
import fantasmas.*

object pacman {
	var image = "pacman.png"
	var position = game.origin()
	var vidas = 3

	method perderVida() {
		vidas--
		position = game.origin()	
	}
}
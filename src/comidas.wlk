import pacman.*
import fantasmas.*
import wollok.game.*

class Comidas{
	var property position
	var property image
	const property  puntosAlSerComida
	
	
	method desaparecer(){
		game.removeVisual(self)
	}
	method esTraspasable() {
		return true
	}
	method chocarCon(algo){}
	
}
class Cereza inherits Comidas{
	override method puntosAlSerComida(){
		return 400
	}

	
}

class Pera inherits Comidas{
	override method puntosAlSerComida(){
		return 200
	}
	
	
}
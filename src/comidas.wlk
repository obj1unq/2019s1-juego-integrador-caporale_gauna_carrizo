import pacman.*
import fantasmas.*
import wollok.game.*

class Comidas{
	var property position
	var property image
	
	
	method desaparecer(){
		game.removeVisual(self)
	}
	
}

class Cereza inherits Comidas{
	const property puntosAlSerComida=200
	
}

class Pera inherits Comidas{
	const property  puntosAlSerComida=400
	
}
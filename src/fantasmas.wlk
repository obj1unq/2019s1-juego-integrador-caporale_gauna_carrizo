import wollok.game.*
import pacman.*


class Fantasma {

 
	var property image
	var property nombre
	var property position
	const numero
	
	constructor(_numero) {
		numero = _numero
	}
	
	method image() = "rival" + numero.toString() + ".png"

	method position() = game.at(numero + 1, numero + 1)


    
   
}
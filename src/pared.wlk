import wollok.game.*
import fantasmas.*
import pacman.*
import comidas.*
import final.*
import orientacionPacman.*

class Pared {
	
	var property image = "pared.png"
	var position
	var numero
	
	constructor(_num,_position){
		numero = _num
		position = _position
	
	}
	
	 method chocasteCon(alguien){
	 	alguien.chocasteConPared()
	 		
	 	
    	}
	
	
}

class Horizontal inherits Pared{
	
}

class Vertical inherits Pared{
	
	override method image () = "paredVertical.png"
	
}		
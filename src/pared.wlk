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
	method chocarCon(alguien){alguien.resetPreviousPosition()}
	
	 method chocasteCon(alguien){
	 	alguien.chocasteConPared()
	 		
	 	
    }
     method chocasteConPacman(pacman, listaFantasmas) {
     	pacman.resetPreviousPosition()
     }
	
	
}

// ESTO SI SE COMENTA, LO DE HORIZONTAL Y VERTICAL SIGUE FUNCIONANDO EL JUEGO. 
// PARA QUE SE USA

class Horizontal inherits Pared{
	
}

class Vertical inherits Pared{
	
	override method image () = "paredVertical.png"
	
}		
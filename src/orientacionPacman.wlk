import wollok.game.*
import fantasmas.*
import comidas.*
import final.*
import pacman.*


class OrientacionPacman {	
	var bocaCerrada = true
	method imagenBocaCerrada() =""
	method imagenBocaAbierta()=""
	method mover(_pacman){ bocaCerrada = not bocaCerrada}
	method image() {
		if (bocaCerrada) {
			return self.imagenBocaCerrada()
		}else {
			return self.imagenBocaAbierta()
		}
	}
}

object arriba inherits OrientacionPacman{
	 override method imagenBocaCerrada()= "otroPacArribaCerrado.png"
	 override method imagenBocaAbierta()= "otroPacArribaAbierto.png"
	
	override method mover(_pacman){
			_pacman.position(_pacman.position().up(1))
			super(_pacman)
			
	}
}
object abajo inherits OrientacionPacman{
	 override method imagenBocaCerrada()= "otroPacAbajoCerrado.png"
	 override method imagenBocaAbierta()= "otroPacAbajoAbierto.png"
	
	override method mover(_pacman){
			_pacman.position(_pacman.position().down(1))
			super(_pacman)
			
	}
}
object derecha inherits OrientacionPacman{
	 override method imagenBocaCerrada()= "otroPacDerechaCerrado.png"
	 override method imagenBocaAbierta()= "otroPacDerechaAbierto.png"
	
	override method mover(_pacman){
			_pacman.position(_pacman.position().right(1))
			super(_pacman)
			
		
	}
}
object izquierda inherits OrientacionPacman{
	 override method imagenBocaCerrada()= "otroPacIzquierdaCerrado.png"
	 override method imagenBocaAbierta()= "otroPacIzquierdaAbierto.png"
	
	override method mover(_pacman){
			_pacman.position(_pacman.position().left(1))
			super(_pacman)
			
	}
}
	
	



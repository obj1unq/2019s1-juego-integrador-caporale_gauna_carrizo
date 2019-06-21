import wollok.game.*
import fantasmas.*
import comidas.*
import bolitas.*
import pacman.*


class OrientacionPacman {
	
	var bocaCerrada = true
	method imagenBocaCerrada() =""
	method imagenBocaAbierta()=""
	method mover(_pacman){}
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
		if ((_pacman.position().up(1).y() < game.height())) {
			_pacman.position(_pacman.position().up(1))
			bocaCerrada = not bocaCerrada
			_pacman.image(self.image())
		} 
		
	}
}
object abajo inherits OrientacionPacman{
	 override method imagenBocaCerrada()= "otroPacAbajoCerrado.png"
	 override method imagenBocaAbierta()= "otroPacAbajoAbierto.png"
	
	override method mover(_pacman){
		if (_pacman.position().down(1).y() >= 0) {
			_pacman.position(_pacman.position().down(1))
			bocaCerrada = not bocaCerrada
			_pacman.image(self.image())
		} 
		
	}
}
object derecha inherits OrientacionPacman{
	 override method imagenBocaCerrada()= "otroPacDerechaCerrado.png"
	 override method imagenBocaAbierta()= "otroPacDerechaAbierto.png"
	
	override method mover(_pacman){
		if ((_pacman.position().right(1).x() < game.width())) {
			_pacman.position(_pacman.position().right(1))
			bocaCerrada = not bocaCerrada
			_pacman.image(self.image())
		} 
		
	}
}
object izquierda inherits OrientacionPacman{
	 override method imagenBocaCerrada()= "otroPacIzquierdaCerrado.png"
	 override method imagenBocaAbierta()= "otroPacIzquierdaAbierto.png"
	
	override method mover(_pacman){
		if (_pacman.position().left(1).x() >= 0) {
			_pacman.position(_pacman.position().left(1))
			bocaCerrada = not bocaCerrada
			_pacman.image(self.image())
		} 
		
	}
}


	
	


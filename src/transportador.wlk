import wollok.game.*
class Transportador {
	var position
	var posicionTraslado
	var property image = "transportador.png"
	method chocasteConPacman(pacman, fantasmas){pacman.position(posicionTraslado)}
	method chocarCon(fantasma){}
	
}
//class Transportador1 inherits Transportador {
//	override method chocasteConPacman(pacman, fantasmas) {
//		if (pacman.position().x() == 0) {
//			pacman.position(game.at(18, pacman.position().y()))
//		}else {
//			pacman.position(game.at(1,pacman.position().y()))
//		}
//	}
//}
//class TransportadorVertical inherits Transportador {
//	override method chocasteConPacman(pacman, fantasmas) {
//		if (pacman.position().y() == 0) {
//			pacman.position(game.at(pacman.position().x(),8))
//		}else {
//			pacman.position(game.at(pacman.position().x(),1))
//		}
//	}
//}
import wollok.game.*
import pacman.*
import comidas.*
import pared.*


class Cartel {
	var entrada = 0
	var property cantidadDeCifras
	var property posicionInicial
	var property hojas = []
	constructor(nroCifras,_posicionInicial){
		cantidadDeCifras = nroCifras
		posicionInicial = _posicionInicial
	}
	method construirHojas() {
		(0..(cantidadDeCifras -1)).forEach{num => hojas.add(new Hoja(self,num))}	
	}
	method actualizarHojas(){
		self.actualizarEntrada()
		var count = 0
		hojas.forEach{hoja => 
			
			if(hoja.position().x() - posicionInicial.x() >= cantidadDeCifras - entrada.toString().size()){
				hoja.image((entrada.toString().charAt(count))+".png")
				count = count + 1
			}
		}
	}
	method actualizarEntrada() { }

	method chocasteConPacman(pacman, fantasmas) {}
	method chocarCon(fantasma){}
}

class Marcador inherits Cartel{

		override method actualizarEntrada() { entrada = pacman.puntos()}
}

class Vida inherits Cartel{

	override method actualizarEntrada() { entrada = pacman.vidas()}
	
	
	
	
}
class Hoja {
	var parteDelMarcador
	const numeroDeHoja
	var property position
	var property image = "0.png"
	constructor (marcador, hojaNro){
		parteDelMarcador = marcador
		numeroDeHoja = hojaNro
		self.position(game.at(parteDelMarcador.posicionInicial().x()+hojaNro, parteDelMarcador.posicionInicial().y()))
	}
	method actualizar(_numStr) {
			self.image(_numStr + ".png")		
	}
	method chocasteConPacman(pacman, fantasmas) {}
	method chocarCon(alguien){}
	method tamanioDelMarcador(){
		return parteDelMarcador.cantidadDeCifras()
	}
}

class CartelImagen {
	var property image = "otroPacDerechaAbierto.png"
	var property position = game.at(15, 9)
	method chocasteConPacman(pacman, fantasmas) {}
	method chocarCon(alguien){}
}
class CartelPuntos {
	
	var property image = "CartelPuntos.png"
	var property position = game.at(0, 9)
	method chocasteConPacman(pacman, fantasmas) {}
	method chocarCon(alguien){}
	
}
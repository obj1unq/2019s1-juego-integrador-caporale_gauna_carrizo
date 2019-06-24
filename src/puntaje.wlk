import wollok.game.*
import pacman.*
import comidas.*
import pared.*


class Marcador {
	var puntaje = 0
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
		self.actualizarPuntaje()
		var count = 0
		hojas.forEach{hoja => 
			
			if(hoja.position().x() - posicionInicial.x() >= cantidadDeCifras - puntaje.toString().size()){
				hoja.image((puntaje.toString().charAt(count))+".png")
				count = count + 1
			}
		}
	}
	method actualizarPuntaje() { puntaje = pacman.puntos()}
	method puntaje() = puntaje
	method chocasteConPacman(pacman, fantasmas) {}
	method chocarCon(fantasma){}
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
class CartelPuntos {
	var property image = "CartelPuntos.png"
	var property position = game.at(0, 9)
	method chocasteConPacman(pacman, fantasmas) {}
	method chocarCon(alguien){}
	
}
import wollok.game.*
import pacman.*
import comidas.*
import pared.*


class Cartel {
	var property cantidadDeCifras
	var property posicionInicial
	var property hojas = []
	constructor(nroCifras,_posicionInicial){
		cantidadDeCifras = nroCifras
		posicionInicial = _posicionInicial
	}
	method entrada() { return 0 }
	method hojasNecesarias() {
		return self.entrada().toString().size()
	}
	method agregarHojaSiFalta() {
		if (self.hojasNecesarias() > hojas.size() ) {
			hojas.add(new Hoja(self,self.hojasNecesarias()))
			game.addVisual(hojas.get(self.hojasNecesarias() -1))
		}
	}
	method chocasteConPacman(pacman, fantasmas) {}
	method chocarCon(fantasma){}
}

class Marcador inherits Cartel{

		override method entrada() { return pacman.puntos()}
}
class Vida inherits Cartel{

	override method entrada() { return pacman.vidas()}
}
class Hoja {
	var parteDelMarcador
	const numeroDeHoja

	constructor (marcador, hojaNro){
		parteDelMarcador = marcador
		numeroDeHoja = hojaNro
	}
	method position(){
		return game.at(parteDelMarcador.posicionInicial().x()+numeroDeHoja, parteDelMarcador.posicionInicial().y())
	}
	method chocasteConPacman(pacman, fantasmas) {}
	method chocarCon(alguien){}
	method image() {
		return parteDelMarcador.entrada().toString().charAt(numeroDeHoja - 1)+".png"
	}
}


class GraficaParaCartel {
	var property image
	var property position
	constructor (imagen, posicion){
		image = imagen
		position = posicion
	}
	method chocasteConPacman(pacman, fantasmas) {}
	method chocarCon(alguien){}
}
import plagas.*
class Elemento {
	method efectoDeAtacar(unaPlaga){
		unaPlaga.efectoDeAtacar()
	}
}

class Hogar inherits Elemento {
	var nivelDeMugre
	var property confortQueOfrece
	
	method nivelDeMugre(unaCantidad){
		nivelDeMugre = nivelDeMugre + unaCantidad
	}
	
	method nivelDeMugre() = nivelDeMugre 
	
	method esBueno() {
		return nivelDeMugre <= confortQueOfrece/2
	}
	method recibirAtaqueDe(unaPlaga) {
		self.nivelDeMugre(unaPlaga.nivelDeDanio())
		self.efectoDeAtacar(unaPlaga)
	}
}

class Huerta inherits Elemento{
	var capacidadDeProduccion
	method capacidadDeProduccion(unaCantidad){
		capacidadDeProduccion = capacidadDeProduccion - unaCantidad
	}
	method capacidadDeProduccion()= capacidadDeProduccion
	
	method esBueno() {
		return capacidadDeProduccion > nivelProduccion.nivelASuperar()
	}
	method recibirAtaqueDe(unaPlaga) {
		const disminucion = unaPlaga.nivelDeDanio() * 0.1 +
			if(unaPlaga.transmiteEnfermedades()){10}else{0}
		self.capacidadDeProduccion(disminucion)
		self.efectoDeAtacar(unaPlaga)
	}
}

object nivelProduccion {
	var property nivelASuperar
}

class Mascota inherits Elemento {
	var nivelDeSalud
	method nivelDeSalud(unaCantidad){
		nivelDeSalud = nivelDeSalud - unaCantidad
	}
	method nivelDeSalud() = nivelDeSalud
	
	method esBueno() {
		return nivelDeSalud > 250
	}
	method recibirAtaqueDe(unaPlaga) {
		if (unaPlaga.transmiteEnfermedades()){
			self.nivelDeSalud(unaPlaga.nivelDeDanio())
			self.efectoDeAtacar(unaPlaga)
		}
		
	}
}


class Barrio {
	const property elementos = []
	method agregarElemento(unElemento){
		elementos.add(unElemento)
	}
	
	method esCopado() {
		const elementosBuenos = self.cantidadDeElementosBuenos()
		return elementosBuenos > elementos.size() - elementosBuenos
	}
	
	method cantidadDeElementosBuenos() {
		return elementos.count { e=> e.esBueno()}
	}
}
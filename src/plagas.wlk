class Plaga {
	var poblacion 
	
	method poblacion() = poblacion 
	method transmiteEnfermedades() = poblacion >= 10
	method efectoDeAtacar() {
		poblacion = poblacion * 1.1
	}
}

class Cucarachas inherits Plaga {
	var pesoPromedio
	method pesoPromedio(unaCantidad){
		pesoPromedio = pesoPromedio + unaCantidad
	}
	method pesoPromedio() = pesoPromedio
	method nivelDeDanio() = poblacion * 0.5
	override method transmiteEnfermedades() = 
		super() && pesoPromedio >= 10 
	override method efectoDeAtacar(){
		super()
		self.pesoPromedio(2)
	}
}

class Pulga inherits Plaga {
	method nivelDeDanio() = poblacion * 2
}

class Garrapata inherits Pulga {
	override method efectoDeAtacar(){
		poblacion = poblacion * 1.2
	}
}

class Mosquito inherits Plaga {
	method nivelDeDanio() = poblacion
	override method transmiteEnfermedades() =
		super() && poblacion % 3 == 0
	
}
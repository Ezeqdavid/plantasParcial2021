import plantas.*


class Parcela {
	const ancho
	const largo
	const property horasDeSol
	var property plantas = []
	
	method superficie() {return ancho * largo}
	method cantidadMaximaDePlantas() {
		return if (ancho > largo) {
			self.superficie() / 5
		} else {
			self.superficie() / 3 + largo
		}
	}
	
	method tieneComplicaciones() {return plantas.any{p => p.horasDeSol() < horasDeSol}}
	
	method plantar(planta) {
		if (self.noHayLugar() or self.plantaNoSobrevive(planta)){
			self.error("No hay lugar para la planta o podria morir.")
		} else {
			plantas.add(planta)
		}
	}
	
	method noHayLugar() {return plantas.size() + 1 > self.cantidadMaximaDePlantas()}
	method plantaNoSobrevive(planta){return (horasDeSol - planta.horasDeSol()) >= 2}

}

class ParcelaEcologica inherits Parcela {
	
	method seAsociaBien(planta) {
		return planta.esParcelaIdeal(self) and !self.tieneComplicaciones()
	}
	method porcentajeBienAsociadas(){
		return (plantas.count{p => self.seAsociaBien(p)} * plantas.size()) / 100
	}
}

class ParcelaIndustrial inherits Parcela {
	
	method seAsociaBien(planta) {
		return planta.esFuerte() and plantas.size() <= 2
	}
	
	method porcentajeBienAsociadas(){
		return (plantas.count{p => self.seAsociaBien(p)} * plantas.size()) / 100
	}
}
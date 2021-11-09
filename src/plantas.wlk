class Planta {
	const property anioDeObtencion
	const property altura
	
	
	method horasDeSol()
	method esFuerte() {return self.horasDeSol() > 10}
	method daNuevasSemillas() {return self.esFuerte()}
	method espacioQueOcupa()
	method esParcelaIdeal(parcela)
}

class Menta inherits Planta {
	
	override method horasDeSol() {return 6}
	override method daNuevasSemillas() {return super() or altura > 0.4}
	override method espacioQueOcupa() {return altura * 3}
	override method esParcelaIdeal(parcela) {return parcela.superficie() > 6}
}

class Soja inherits Planta {
	
	override method horasDeSol() {
		return if (altura < 0.5) {
				6 
			}
			else if (altura < 1) {
				7
			}
			else if (altura >= 1) {
				9
		}
	}
	
	override method daNuevasSemillas() {return super() or anioDeObtencion > 2007 && altura > 1}
	override method espacioQueOcupa() {return altura/2}
	override method esParcelaIdeal(parcela) {return parcela.horasDeSol() == self.horasDeSol()}
}

class Quinoa inherits Planta {
	const property horasDeSol
	
	override method horasDeSol() {return horasDeSol}
	override method espacioQueOcupa() {return 0.5}
	override method daNuevasSemillas() {return super() or anioDeObtencion < 2005}
	override method esParcelaIdeal(parcela) {return parcela.plantas().all{p => p.altura() < 1.5}}
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() {return false}
	override method esParcelaIdeal(parcela) {return parcela.cantidadMaximaDePlantas() == 1}
}

class HierbaBuena inherits Menta {
	override method espacioQueOcupa() {return super() * 2}
}
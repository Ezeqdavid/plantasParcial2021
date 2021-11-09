import parcelas.*

class INTA {
	var parcelas = []
	
	method agregar(parcela){
		parcelas.add(parcela)
	}
	
	method promedioDePlantas(){
		return parcelas.sum{p => p.plantas().size()}/parcelas.size()
	}
	
	method laMasAutosustentable(){
		const con4oMasPlantas = parcelas.filter{p => p.plantas().size() > 4}
		return con4oMasPlantas.max{p => p.porcentajeBienAsociadas()}
	}
}

import plantas.*
class Parcela {
	const property largo
	const property ancho
	const property horasDeSolPorDia
	const property plantas = #{}
	const property tipoDeParcela 
	
	method agregarPlanta(cual){ plantas.add(cual)}
	method quitarPlanta(cual){ plantas.remove(cual)}
	
	method superficie(){ return self.largo() * self.ancho()}
	method cantidadDePlantasToleradas(){ return if (self.largo() >3){ self.largo()+4} else { self.superficie()/2}}
	method tieneSangreJoven(){ return plantas.any({planta=>planta.anoDeObtencion() > 2012})}
	method plantarUna(planta){ 
		if (self.cantidadDePlantasToleradas() == self.plantas().size()){
			self.error("ya no se puede plantar mas")
		}
		else if ((self.horasDeSolPorDia() - planta.horasDeSolToleradas()) >= 2){
			self.error("la planta no tolera tantas horas de sol")
		}
		else { plantas.add(planta)}
	}
	method esIdealPara(planta){ return planta.esIdeal(self) }
	method esEcologica(){return self.tipoDeParcela() == "ecologica" }
	method esIndustrial(){return self.tipoDeParcela() == "industrial" }
	method seAsociaBien(planta){
		if (self.esEcologica()) {return planta.esIdeal(self) and self.tieneSangreJoven() }
		else if (self.esIndustrial()) {return planta.esFuerte() and self.plantas().size() <= 2}
		else {return false}
	}
	method cantidadDePlantasBienAsociadas(){ return plantas.filter({planta=>self.seAsociaBien(planta)}).size()}
	method porcentajeDePlantasAsociadas(){ return (self.cantidadDePlantasBienAsociadas() *  100) / self.plantas().size() }
}


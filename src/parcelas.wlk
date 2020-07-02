import plantas.*
class Parcela {
	const property largo
	const property ancho
	const property horasDeSolPorDia
	const property plantas = #{}
	
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
}

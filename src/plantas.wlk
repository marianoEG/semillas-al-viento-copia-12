import parcelas.*
class Planta {
	const property anoDeObtencion
	var property altura
	
	method horasDeSolToleradas(){ return 7}
	method esFuerte(){ return self.horasDeSolToleradas() > 9}
	method daNuevasSemillas() { return self.esFuerte() }
	method espacioQueOcupa()
	method esIdeal(parcela)
	
}

class Menta inherits Planta {
	override method daNuevasSemillas(){ return super() or self.altura() > 0.4}
	override method espacioQueOcupa(){ return self.altura() * 3}
	override method esIdeal(parcela){ return parcela.superficie() > 6}
}

class Soja inherits Planta {
	override method horasDeSolToleradas(){
		return 
			if (self.altura() < 0.5) { 6 }
			else if (self.altura().between(0.5,1)) { 8 }
			else { 12 }
	}
	override method daNuevasSemillas(){
		return  super() or (self.anoDeObtencion() > 2007 and self.altura().between(0.75,0.9))
	}
	override method espacioQueOcupa(){ return self.altura() / 2}
	override method esIdeal(parcela){ return parcela.horasDeSolPorDia() == self.horasDeSolToleradas()}
}

class Quinoa inherits Planta {
	const property espacioOcupado
	
	override method espacioQueOcupa() { return self.espacioOcupado()}
	override method horasDeSolToleradas(){ return if (self.espacioQueOcupa() < 0.3){ 10 } else { super()}}
	override method daNuevasSemillas(){ return super() or self.anoDeObtencion() < 2005}
	override method esIdeal(parcela){ return parcela.plantas().all({planta=>planta.altura() <= 1.5})}
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas(){ return false }
	override method esIdeal(parcela){ return parcela.cantidadDePlantasToleradas() == 1 }
}

class Hierbabuena inherits Menta {
	override method espacioQueOcupa(){ return super() * 2}
}

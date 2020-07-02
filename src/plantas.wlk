class Planta {
	const property anoDeObtencion
	var property altura
	
	method horasDeSolToleradas(){ return 7}
	method esFuerte(){ return self.horasDeSolToleradas() > 9}
	method daNuevasSemillas() { return self.esFuerte() }
	method espacioQueOcupa()
	
}

class Menta inherits Planta {
	override method daNuevasSemillas(){ return super() or self.altura() > 0.4}
	override method espacioQueOcupa(){ return self.altura() * 3}
	
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
}

class Quinoa inherits Planta {
	const property espacioOcupado
	
	override method espacioQueOcupa() { return self.espacioOcupado()}
	override method horasDeSolToleradas(){ return if (self.espacioQueOcupa() < 0.3){ 10 } else { super()}}
	override method daNuevasSemillas(){ return super() or self.anoDeObtencion() < 2005}
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas(){ return false }
}

class Hierbabuena inherits Menta {
	override method espacioQueOcupa(){ return super() * 2}
}

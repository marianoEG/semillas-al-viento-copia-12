import parcelas.*
import plantas.*

object inta {
	var property parcelas = []
	
	method cantidadDePlantas(){ return parcelas.sum({parcela=>parcela.plantas().size()})}
	method cantidadDeParcelas() { return parcelas.size()}
	method promedioDePlantasPorParcela(){return  self.cantidadDePlantas() / self.cantidadDeParcelas() }
	method parcelasConMasDeCuatroPlantas(){ return parcelas.filter({par=>par.plantas().size() > 4 })}
	method parcelaMasAutoSustentable(){ return self.parcelasConMasDeCuatroPlantas().max({par=>par.porcentajeDePlantasAsociadas()})}
}

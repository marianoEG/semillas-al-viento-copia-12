import parcelas.*
import plantas.*

object inta {
	var property parcelas = []
	
	method cantidadDePlantas(){ return parcelas.sum({parcela=>parcela.plantas().size()})}
	method cantidadDeParcelas() { return parcelas.size()}
	method promedioDePlantasPorParcela(){return  self.cantidadDePlantas() / self.cantidadDeParcelas() }
	method parcelaMasAutoSustentable(){}
}

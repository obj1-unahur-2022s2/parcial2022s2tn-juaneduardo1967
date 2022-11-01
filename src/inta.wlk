import plantas.*
import parcelas.*
object inta{
	const property parcelas=#{}
	method promedioDePlantas()=parcelas.sum({p=>p.canDePlantas()})/ parcelas.size()
	method parcelasconMasPlantasDe(unValor)=parcelas.filter({p=>p.cantDePlantas()>unValor})
    method esMasAutosustentable()= self.parcelasconMasPlantasDe(4).max({p=>p.porcentajeDePlantasBienAsociadas()})
    method agregarParcela(unaParcela)=parcelas.add(unaParcela)
}
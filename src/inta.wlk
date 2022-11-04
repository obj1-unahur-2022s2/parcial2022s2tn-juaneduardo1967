/*
 * agregarParcela(unaParcela) es un método de indiciacion, no es de consuta.
 */
import plantas.*
import parcelas.*
object inta{
	const property parcelas=[]
	method promedioDePlantas(){return (parcelas.sum({p=>p.cantDePlantas()}))/ parcelas.size()}
	method parcelasconMasPlantasDe(unValor)=parcelas.filter({p=>p.cantDePlantas()>unValor})
    method esMasAutosustentable()= self.parcelasconMasPlantasDe(4).max({p=>p.porcentajeDePlantasBienAsociadas()})
    method agregarParcela(unaParcela) { parcelas.add(unaParcela) }
    
}
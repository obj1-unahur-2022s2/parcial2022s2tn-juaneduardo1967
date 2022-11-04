/*
*- ```plantarPlanta(unaPlanta)``` es un método de indicación, no es de consulta. No debría tener el return. 
*- Recordar que lanzar una excepción corta la ejecución del método de formar que te permite armar un if sin else
*- ```seAsociaBien(unaPlanta)``` debía ser un método abstracto en Parcela
*- Como el método ``` porcentajeDePlantasBienAsociadas()``` es el mismo código en las parecelas ecológicas e industriales debias colocarlo en Parcela para que lo herende y no repetir los mismo en ambas clases
*- Como el método ``` cantDePlantasBienAsociadas()``` es el mismo código en las parecelas ecológicas e industriales debias colocarlo en Parcela para que lo herende y no repetir los mismo en ambas clases
* 
*/
import plantas.*

class Parcela {
	const  property ancho
	const property largo
	const property horasDeSolQueRecibe
	const property plantas=[]
	method superficie()=ancho*largo
	method cantMaximaDePlantas(){return if (ancho>largo){self.superficie()/5}
		else{self.superficie()/3+largo}}
	method tieneComplicaciones()= plantas.any({p=>p.horasDeSolQueTolera()< horasDeSolQueRecibe})
	method plantarPlanta(unaPlanta){ 
		if (self.sePuedePlantar(unaPlanta) &&  self.cantDePlantas()<self.cantMaximaDePlantas())
		{plantas.add(unaPlanta)}	
		else{self.error("no se puede plantar")}
		}
		
	method sePuedePlantar(unaPlanta)= (horasDeSolQueRecibe-unaPlanta.horasDeSolQueTolera())<=2	
	method cantDePlantas()=plantas.size()
	method alturaDeLasPlantasQueTiene()= plantas.map({p=>p.altura()})	
	method seAsociaBien(unaPlanta)	
	method porcentajeDePlantasBienAsociadas()=(self.cantDePlantasBienAsociadas()*100)/self.cantDePlantas()
	method cantDePlantasBienAsociadas()=plantas.count({p=>self.seAsociaBien(p)})
}
		
class ParcelasEcologicas inherits Parcela{
	override method seAsociaBien(unaPlanta)=!self.tieneComplicaciones()&& unaPlanta.sueloQuePrefiere(self)		
}
class ParcelasIndustriales inherits Parcela{
	override method seAsociaBien(unaPlanta)=self.cantDePlantas()<=2&& unaPlanta.esFuerte()	
}


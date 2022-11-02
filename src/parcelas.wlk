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
	method plantarPlanta(unaPlanta){return  if (self.sePuedePlantar(unaPlanta) && self.cantDePlantas()<self.cantMaximaDePlantas())
		{plantas.add(unaPlanta)}	else{self.error("no se puede plantar")}}
	method sePuedePlantar(unaPlanta)= (horasDeSolQueRecibe-unaPlanta.horasDeSolQueTolera())<2	
	method cantDePlantas()=plantas.size()
	method alturaDeLasPlantasQueTiene()= plantas.map({p=>p.altura()})	
	method cantDePlantasBienAsociadas()	
		}
		
	class ParcelasEcologicas inherits Parcela{
		method seAsociaBien(unaPlanta)=!self.tieneComplicaciones()&& unaPlanta.sueloQuePrefiere(self)
		override method cantDePlantasBienAsociadas()=plantas.count({p=>self.seAsociaBien(p)})
		method porcentajeDePlantasBienAsociadas()=(self.cantDePlantasBienAsociadas()*100)/self.cantDePlantas()
		
	}
	class ParcelasIndustriales inherits Parcela{
		method seAsociaBien(unaPlanta)=self.cantDePlantas()<=2&& unaPlanta.esFuerte()
		override method cantDePlantasBienAsociadas()=plantas.count({p=>self.seAsociaBien(p)})
		method porcentajeDePlantasBienAsociadas()=(self.cantDePlantasBienAsociadas()*100)/self.cantDePlantas()
	}


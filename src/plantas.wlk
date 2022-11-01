class Plantas{
	var altura 
	const anioDeObtencion
	method esFuerte()
}

class Menta inherits Plantas{
	
	
	method suelosQuePrefiere(unaParcela)=unaParcela.superficie()>=6
	method horasDeSolQueTolera()=6
	method espacioQueOcupa()= altura*3
	method daSemillas()= altura>0.4
    override method esFuerte()=self.horasDeSolQueTolera()>10
}
class Soja inherits Plantas{
	method suelosQuePrefiere(unaParcela)=unaParcela.horasDeSolQueRecibe()==self.horasDeSolQueTolera()
	method horasDeSolQueTolera(){return if (altura<0.5){6} else if (altura<1){7} else{9}}
	method espacioQueOcupa()= altura/2
	method daSemillas()= altura>1&& anioDeObtencion>2007 or self.esFuerte()
    override method esFuerte()=self.horasDeSolQueTolera()>10
}
class Quinoa inherits Plantas {
	
	var horasDeSol
	method suelosQuePrefiere(unaParcela)=unaParcela.alturaDeLasPlantasQueTiene().any({p=>p.altura()<1.5})
	method espacioQueOcupa()=0.5
	method daSemillas()=anioDeObtencion<2005 or self.esFuerte()
	method horasDeSolQueTolera()=horasDeSol
    override method esFuerte()=self.horasDeSolQueTolera()>10
}
class SojaTransgenica inherits Soja{
	override method daSemillas()=false
}
class HierbaBuena inherits Menta{
	override method espacioQueOcupa()=super()*2
}
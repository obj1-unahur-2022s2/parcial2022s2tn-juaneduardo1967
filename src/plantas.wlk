/*
 * - Plantas debía tener el método ``horasDeSolQueTolera()``` abstracto
 * - El método ```esFuerte()``` no debía ser abstracto. Debía tener la siguiente implementacion:
 * ``` method esFuerte() = self.horasDeSolQueTolera() > 10  ```
 * y no debería estar sobreescrito en ningúna subclase
 * - ```daSemillas()``` debía ser un método con implementación en Plantas
 * - En la clase Menta debías sobreescribir los métodos ```horasDeSolQueTolera()``` y  ```daSemillas()```.
 * - En ```daSemillar()``` debías usar super() en todas las subclases
 * - Te falto hacer le getter al atributo altura o ponerlo como var property porque en parcelas esta llamando a p.altura() y no entendie ese mensaje porque no esta el método de retorna el valor del atributo.
 * - El método ```sueloQuePrefiere()``` debía ser abstracto
 * - El método ```sueloQuePrefiere()``` de Quinoa esta llamado al método alturaDeLasPlantasQueTiene() que hace un map() y ya te devuelve altura y luego estas utilizando la planta p.altura() que esta mal
 */
class Plantas{
	var property altura 
	const anioDeObtencion
	method horasDeSolQueTolera()
	method esFuerte() = self.horasDeSolQueTolera() > 10 
	method daSemillas() = self.esFuerte()
	method sueloQuePrefiere(unaParcela)
}

class Menta inherits Plantas{
	
	
	override method sueloQuePrefiere(unaParcela)=unaParcela.superficie()>=6
	override method horasDeSolQueTolera()=6
	method espacioQueOcupa()= altura*3
	override method daSemillas()= super() || altura>0.4
    
}
class Soja inherits Plantas{
	override method sueloQuePrefiere(unaParcela)=unaParcela.horasDeSolQueRecibe()==self.horasDeSolQueTolera()
	override method horasDeSolQueTolera(){return if (altura<0.5){6} else if (altura<1){7} else{9}}
	method espacioQueOcupa()= altura/2
	override method daSemillas()= super() or (altura>1&& anioDeObtencion>2007) 
    
}
class Quinoa inherits Plantas {
	
	var horasDeSol
	override method sueloQuePrefiere(unaParcela)= unaParcela.alturaDeLasPlantasQueTiene().any({p=>p<1.5})
	method espacioQueOcupa()=0.5
	override method daSemillas()=anioDeObtencion<2005 or super()
	override method horasDeSolQueTolera()=horasDeSol
   
}
class SojaTransgenica inherits Soja{
	override method daSemillas()=false
}
class HierbaBuena inherits Menta{
	override method espacioQueOcupa()=super()*2
}
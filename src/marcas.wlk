
import personas.*
import carpasYjarras.*

class Marca{
	const property gramosDeLupulo
	const property pais	//  es un string  "Alemania", "Checoslovaquia" y "Belgica"
}

class Rubia inherits Marca{
	var property graducacion   //   Si es rubia tenes que setear su graduacion de alcohol tengo un setter y un getter con el property 	
}

class Negra inherits Marca{
	method graducacion(){
		return graduacionReglamentaria.graduacionReglamentariaNegra().min(2 * gramosDeLupulo)
	}
}

class Roja inherits Negra{
	override method graducacion(){
		return super() * 1.25
	} 
}

 // Hacer la graduacion completa
object graduacionReglamentaria{
	
	var property graduacionReglamentariaNegra = 14
	var property graduacionRubia = null
	var property graduacionRoja  = null
}
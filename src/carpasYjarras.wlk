import personas.*

class Carpa{
	const property limit // numero 
	var property tieneBanda  // bool
	var property marca  //  se asigna una referencia a la marca
	var personas //#{}
	method cantidadPersonas(){
		return personas.size()
	}
	
	
	method agregarPersona(persona){
		personas.add(persona)
	}
	method puedeIngresar(persona){
		return self.cantidadPersonas() + 1 < limit && not persona.estaEbria()
	}
	
	method entrar(persona){
		if(persona.quiereEntrar(self) && self.puedeIngresar(persona)){
			self.agregarPersona(persona)
		}else{
			// Dar error "Esta persona no puede ingresar a la carpa"
		}
	}
	
	method cantidadDeEbriosEmpedernidos(){
		// necesito  la cantidad de todas las personas que compraron todas las jarras mas de un litro 
		//me quedo con las personas que compraron todas las jarras mayor a 1 litro 
		 return personas.filter{persona => persona.tieneTodaslasJarras(1)}.size()
	}
}

class Jarra{
	const property litros //  numero en litros
	const property marca
	
	method contenidoAlcoholico(){
		return marca.graduacionAlcohol() * litros 
	}
}
class Marca{
	const property gramosDeLupulo
	const property pais	//  es un string  "Alemania", "Checoslovaquia" y "Belgica"
}

class MarcaCervezaRubia inherits Marca{
	var property graduacionAlcohol   //   Si es rubia tenes que setear su graduacion de alcohol tengo un setter y un getter con el property 	
}

class MarcaCervezaNegra inherits Marca{
	method graduacionAlcohol(){
		return graduacionReglamentaria.graduacionNegra().min(2 * gramosDeLupulo)
	}
}

class MarcaCervezaRoja inherits MarcaCervezaNegra{
	override method graduacionAlcohol(){
		return super() * 1.25
	} 
}

 // Hacer la graduacion completa
object graduacionReglamentaria{
	method graduacionRubia(){}
	method graduacionNegra() = 0.02
	method graduacionRoja(){}  	
}
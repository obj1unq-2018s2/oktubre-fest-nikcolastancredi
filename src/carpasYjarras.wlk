import personas.*
import marcas.*

class Carpa{
	const property limit // numero 
	const property tieneBanda  // bool
	const property marca  //  se asigna una referencia a la marca
	const personas //#{}
	
	method cantidadPersonas() = personas.size()
	
	
	method agregarPersona(persona){
		personas.add(persona)
	}
	
	method puedeIngresar(persona) = self.cantidadPersonas() + 1 < limit && not persona.estaEbria()
	
	
	method entrar(persona){
		if(persona.quiereEntrar(self) && self.puedeIngresar(persona)){
			self.agregarPersona(persona)
		}else{
			self.error("No se puede ingresar a la Carpa- Vuelva Pronto ")
			// Dar error "Esta persona no puede ingresar a la carpa"
		}
	}
	
	method cantidadDeEbriosEmpedernidos() = 
	personas.count{persona => persona.esEbrioEmpederinido()}
		// necesito  la cantidad de todas las personas que compraron todas las jarras mas de un litro 
		//me quedo con las personas que compraron todas las jarras mayor a 1 litro 
		
}

class Jarra{
	const property litros //  numero en litros
	const property marca
	
	method contenidoAlcoholico() = marca.graduacionAlcohol() * litros / 100

}
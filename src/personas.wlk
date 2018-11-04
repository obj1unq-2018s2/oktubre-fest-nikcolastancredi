import carpasYjarras.*

class Persona{
	var property peso
	var property jarrasTomadas // #{} es un conjunto de objetos del tipo jarra
	var property leGustaMusica // es un booleano
	var property aguante   //  es un numero

		
	method estaEbria() = self.cantidadAlcohol() * peso > aguante
	
	method cantidadAlcohol(){
		return jarrasTomadas.sum{jarra=>jarra.contenidoAlcoholico()}
	}
	
	method entrarA(carpa){
		carpa.entrar(self)
	}
	
	method tieneTodaslasJarras(unNum){ // retorna true si todas las jarras que tomo son mayor a 1 litro 
		return jarrasTomadas.all{jarra => jarra.litros() >= unNum}
	}
}

class PersonaCheca inherits Persona{
	const property paisDeOrigen =  "Checoslovaquia"
	
	method gustaEsta(marca) {
		return marca.graduacionAlcohol() > 0.08
	} 
	
	method quiereEntrar(carpa){
		return self.gustaEsta(carpa.marca()) && carpa.tieneBanda() == leGustaMusica 
	}	
	
	method esPatriota(){
		return self.jarrasTomadas().all{jarra=>jarra.marca().pais() == paisDeOrigen}
	}
}

class PersonaBelga inherits Persona{
	const property paisDeOrigen = "Belgica"
	
	method gustaEsta(marca){
		return marca.graduacionAlcohol() > 0.04
	}
	
	method quiereEntrar(carpa){
		return self.gustaEsta(carpa.marca()) && carpa.tieneBanda() == leGustaMusica 
	}
	
	method esPatriota(){
		return self.jarrasTomadas().all{jarra=>jarra.marca().pais() == paisDeOrigen}
	}
}

class PersonaAlemana inherits Persona{
	const property paisDeOrigen = "Alemania"
	
	method gustaEsta(marca) = true
	
	method quiereEntrar(carpa){
		return self.gustaEsta(carpa.marca()) && carpa.tieneBanda() == leGustaMusica && carpa.cantidadPersonas().even()
	}
	
	method esPatriota(){
		return self.jarrasTomadas().all{jarra=>jarra.marca().pais() == paisDeOrigen}
	}
}


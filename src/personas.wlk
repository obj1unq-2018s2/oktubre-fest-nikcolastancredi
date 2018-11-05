import carpasYjarras.*
import marcas.*

class Persona{
	var property peso
	var property jarrasTomadas // #{} es un conjunto de objetos del tipo jarra
	var property leGustaMusica // es un booleano
	var property aguante   //  es un numero
		
	method estaEbria() = self.cantAlcoholIngerido() * peso > aguante
	
	method cantAlcoholIngerido(){
		return jarrasTomadas.sum{jarra=>jarra.contenidoAlcoholico()}
	}
	method gustaEsta(marca)
	
	method quiereEntrar(carpa) = self.gustaEsta(carpa.marca()) && carpa.tieneBanda() == leGustaMusica
	
	method entrarA(carpa){
		carpa.entrar(self)
	}
	
	method esEbrioEmpederinido() = self.estaEbria() && jarrasTomadas.all{jarra => jarra.litros() > 1}
	
		 
	method pais()
	
	method esPatriota() = jarrasTomadas.all{jarra=>jarra.marca().pais() == self.pais()}
}

class Checa inherits Persona{
	
	override method pais()= "Checoslovaquia"
	
	override method gustaEsta(marca) = marca.graduacionAlcohol() > 0.08
		
	
}

class Belga inherits Persona{
	override method pais()= "Belgica"
	
	override method gustaEsta(marca) = marca.gramosDeLupulo() > 0.04 
	
}

class Aleman inherits Persona{
	override method pais() = "Alemania"
	
	override method gustaEsta(marca) = true
	
	override method quiereEntrar(carpa) = super(carpa) && carpa.cantidadPersonas().even()
	
	
}


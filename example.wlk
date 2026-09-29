class Nave{
  var velocidad
  var direccion 
  var combustible = 500


  method acelerar(cuanto){
    velocidad += cuanto.min(100000)
      
  }

  method desacelerar(cuanto){
    velocidad -= cuanto.max(0)
  }

  method irHaciaElSol(){
    direccion = 10 
  }

  method escaparDelSol(){
    direccion = -10 
  }

  method ponerseParaleloAlSol{
    direccion = 0
  }

  method acercarseUnPocoAlSol(){
    direccion += 1.min(10)
  }

  method alejarseUnPocoDelSol(){
    direccion -= 1.max(-10)
  }

  method prepararViaje(){
    self.cargarCombustible(30000)
    self.acelerar(5000)
  }

  method cargarCombustible(cantCombustible){
    combustible += cantCombustible

  }

  method descargarCombustible(cantCombustible){
    combustible -= cantCombustible
  }

}





class NaveBaliza inherits Nave{
  var color = "rojo"

  method cambiarColorDeBaliza(colorNuevo){

    color = colorNuevo

  }

  override method prepararViaje(){
    super();
    self.cambiarColorDeBaliza.("verde")
    self.ponerseParaleloAlSol()
  }


}




class NaveDePasajeros inherits Nave{
  const cantidadDePasajerods //Se le indicara en cada nave.
  var comidas
  var bebidas

  method cantidadDePasajerods() = cantidadDePasajerods

  //Cargar y descargar bebidas y comidas

  method cargarComida(cantidad){
    comidas += cantidad
  }

  method descargarComidas(cantidad){
    comidas -= cantidad
  }

  method cargarBebidas(cantidad){
    bebidas += cantidad
  }

  method descargarBebidas(cantidad){
    bebidas -= cantidad
  }

  override method prepararViaje(){
    super();
    self.cargarComida(4)
    self.cargarBebidas(6)
    self.acercarseUnPocoAlSol()
  }


}




class NaveCombate inherits Nave{

  var estaInvisible = false
  var misilesDesplegados = false
  var mensajesEmitidos = #[]
  
  // Invisible
  method estaInvisible() = estaInvisible

  method ponerseVisible(){
    estaInvisible = false
  }

  method ponerseInvisible(){
    estaInvisible = true
  }

  // misiles


  method misilesDesplegados() = misilesDesplegados

  method replegarMisiles(){
    misilesDesplegados = false
  }

  method desplegarMisiles(){
    misilesDesplegados = true
  }

  // Emitir mensajes
  method emitirMensaje(mensaje) = mensajesEmitidos.add(mensaje)

  method mensajesEmitidos() mensajesEmitidos

  method primerMensajeEmitido() = mensajesEmitidos.first()

  method ultimoMensajeEmitido() = mensajesEmitidos.last()

  method esEscueta() = mensajesEmitidos.all( {m => m.size() < 30})

  method emitioMensaje(mensaje) 0 =  mensajesEmitidos.isEmpty()


  override method prepararViaje(){
    super();
    self.replegarMisiles()
    self.acelerar(15000)
    self.emitirMensaje("Saliendo en misión")
  }
}


//Dos variantes de Naves
class NaveHospital inherits NaveDePasajeros{


}

class NaveCombateSigilosa inherits NaveCombate{


}

//relajo
// estaDeRelajo(): esta tranquila y poca actividad esta en super, es decir, Nave. Pero..
//En poca actividad va a ser un metodo abstracto, va a estar definido en dos naves: NaveBaliza y NaveDePasajeros
//¿Pero que pasa con las demas?, las demas Naves necesitaran un neutro, para eso usamos true, porque true and true no afecta.


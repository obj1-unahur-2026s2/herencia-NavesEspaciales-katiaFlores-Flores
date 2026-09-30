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

  method ponerseParaleloAlSol(){
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

  method naveEstaTranquila() = combustible >= 4000 and velocidad < 12000

  method recibirAmenaza() {
    self.escapar()
    self.avisar()
  }

  method escapar() 

  method avisar() 

  method estaNaveRelajado() = self.naveEstaTranquila() and self.tienePocaActividad()

  method tienePocaActividad() = true
}





class NaveBaliza inherits Nave{
  var color 
  var cambioDeColor = false

  method cambiarColorDeBaliza(colorNuevo){

    color = colorNuevo
    cambioDeColor = true

  }

  override method prepararViaje(){
    super();
    self.cambiarColorDeBaliza("verde")
    self.ponerseParaleloAlSol()
  }

  override method naveEstaTranquila() = super() and color != "rojo"

  override method escapar(){
    self.irHaciaElSol()
  } 

  override method avisar(){
    self.cambiarColorDeBaliza("rojo")
  }

  override method tienePocaActividad() = !cambioDeColor

}




class NaveDePasajeros inherits Nave{
  const cantidadDePasajeros //Se le indicara en cada nave.
  var comidas
  var bebidas
  var racionesRepartidasPorComida = 0

  method cantidadDePasajerods() = cantidadDePasajeros

  //Cargar y descargar bebidas y comidas

  method cargarComida(cantidad){
    comidas += cantidad
  }

  method descargarComidas(cantidad){
    comidas -= cantidad
    racionesRepartidasPorComida += cantidad
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

  override method escapar(){
    velocidad = velocidad * 2
  } 

  override method avisar(){
    self.descargarComidas(2)
    self.descargarBebidas(2)
  }

  override method tienePocaActividad() = racionesRepartidasPorComida <= 50


}




class NaveCombate inherits Nave{

  var estaInvisible = false
  var misilesDesplegados 
  const mensajesEmitidos = []
  
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

  method mensajesEmitidos() = mensajesEmitidos

  method primerMensajeEmitido() = mensajesEmitidos.first()

  method ultimoMensajeEmitido() = mensajesEmitidos.last()

  method esEscueta() = mensajesEmitidos.all( {m => m.size() < 30})

  method emitioMensaje(mensaje) =  mensajesEmitidos.any({ m => m == mensaje})

  //Sobrescribiendo methodos de la superClase
  override method prepararViaje(){
    super();
    self.replegarMisiles()
    self.acelerar(15000)
    self.emitirMensaje("Saliendo en misión")
  }

  override method escapar(){
    self.acercarseUnPocoAlSol()
    self.acercarseUnPocoAlSol()
  } 

  override method avisar(){
    self.emitirMensaje("Amenaza recibida")
  }

 
}


//Dos variantes de Naves
class NaveHospital inherits NaveDePasajeros{
  var tieneQuirofanos

  method tieneQuirofanos() = tieneQuirofanos

  override method naveEstaTranquila() = super() and !self.tieneQuirofanos()

  override method recibirAmenaza(){
    super();
    tieneQuirofanos = true
  } 
  
}

class NaveCombateSigilosa inherits NaveCombate{
 
  override method naveEstaTranquila() = super() and !self.misilesDesplegados() and self.estaInvisible()
  
  override method recibirAmenaza(){
    super();
    self.ponerseInvisible()
    self.desplegarMisiles()

  } 

}


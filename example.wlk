class Nave{
  var velocidad
  var direccion 


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

  method prepararViaje()

}





class NaveBaliza inherits Nave{
  var color = "rojo"

  method cambiarColorDeBaliza(colorNuevo){

    color = colorNuevo

  }

  override method prepararViaje(){

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

  }


}


class NaveCombate inherits Nave{

  var estaInvisible = false
  var misilesDesplegados = false
  
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
  method emitirMensaje(mensaje){
    
  }

  method mensajesEmitidos(){

  }

  method primerMensajeEmitido(){

  }

  method ultimoMensajeEmitido(){

  }

  method esEscueta(){

  }

  method emitioMensaje(mensaje){

  }


  override method prepararViaje(){

  }
}

//NOTAS:
//relajo
// estaDeRelajo(): esta tranquila y poca actividad esta en super, es decir, Nave. Pero..
//En poca actividad va a ser un metodo abstracto, va a estar definido en dos naves: NaveBaliza y NaveDePasajeros
//¿Pero que pasa con las demas?, las demas Naves necesitaran un neutro, para eso usamos true, porque true and true no afecta.


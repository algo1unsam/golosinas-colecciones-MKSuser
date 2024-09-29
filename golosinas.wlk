/////////Clases de Golosinas/////////
class Bombon{
    var property precio = 5
    var property sabor = frutilla
    var property peso = 15
    const property glutenFree = true
    var property contadorMordisco = 0

    method mordisco (){
        peso = (peso * 0.8) - 1
        contadorMordisco += 1
        return peso
    }
}
class BombonDuro inherits Bombon{

    override method mordisco() {
        peso = (peso * 0.9)
        return peso
    }

}
class Alfajor{
    var property precio = 12
    const property sabor = chocolate
    var property peso = 300
    const property glutenFree = false
    var property contadorMordisco = 0

    method mordisco (){
        peso = (peso * 0.8)
        return peso
    }

}
class Caramelo{
    var property precio = 1
    var property sabor = frutilla
    var property peso = 5
    const property glutenFree = true
    var property contadorMordisco = 0

    method mordisco (){
        peso -= 1
        return peso
    }

}
class CarameloRelleno inherits Caramelo{

    override method mordisco (){
        peso -= 1
        sabor = chocolate
        return peso
    }

}
class Chupetin{
    var property precio = 2
    var property sabor = naranja
    var property peso = 7
    const property glutenFree = true
    var property contadorMordisco = 0

    method mordisco (){
        
        if (peso > 2) {
            peso = (peso * 0.9)
        }

        return peso

    }

}
class Oblea{
    var property precio = 5
    var property sabor = vainilla
    var property peso = 250
    const property glutenFree = false
    var property contadorMordisco = 0

    method mordisco (){
        if (peso > 70)
            peso = (peso * 0.5)
        else peso = (peso * 0.75)
    
        return peso
    }

}
class ObleaCrujiente inherits Oblea{

    override method mordisco (){
        if (peso > 70)
            peso = (peso * 0.5)
        else peso = (peso * 0.75)

        if (contadorMordisco < 3)
            peso -= 3
            contadorMordisco +=1
    
        return peso
    }

}
class Chocolatin{
    var property sabor = chocolate
    var property peso = 0
    var property precio = 0
    const property glutenFree = false
    var property contadorMordisco = 0

    method pesoInicial(valor){
        peso = valor
        precio = (peso * 0.5)

    }

    method mordisco(){
        peso -= 2

        return peso
    }

}
class ChocolatinVIP inherits Chocolatin{
    var property humedad = 0.5 // Esto pa que sea random: 0.randomUpTo(1.0)

    override method pesoInicial(valor){
        peso = (valor) * (1 + humedad) 
        precio = (peso * 0.5)

    }

}
class ChocolatinPremium inherits ChocolatinVIP{
    
    override method pesoInicial(valor){
        peso = (valor) * ( 1 + (humedad * 0.5) ) 
        precio = (peso * 0.5)

    }
}
class Baniada{
    var property gBase = vacio
    var property precio = 0
    var property sabor = sinSabor
    var property peso = 0
    var property glutenFree = false
    var property baniado = 0

    method gBase1(golo1){
        baniado = 4
        
        gBase = golo1

        peso = golo1.peso() + baniado
        precio = golo1.precio() + 2
        sabor = golo1.sabor()
        glutenFree = golo1.glutenFree()

    }

    method mordisco(){

        peso = gBase.mordisco()
        
        if (baniado > 0) {
            baniado -= 2
        }

        peso = peso + baniado

    }

}
class Pastilla{
    var property precio = 0
    var property sabor = frutilla
    var property peso = 5
    var property glutenFree = vacio
    const property gustos = [chocolate, naranja, frutilla]
    //var property i = 0

    method elegirGluten(valor){

        if (valor){
            glutenFree = valor
            precio = 7
        }
        if (not valor){
            glutenFree = valor
            precio = 10
        }
    }
    
    method mordisco(){
        self.cambiaGusto()
        return peso
    }

    method cambiaGusto(){

        sabor = (gustos.first())
        gustos.add(gustos.first())
        gustos.remove(gustos.first())
        /*if (i == 3) {i = 0}
        
        sabor = gustos.get(i)
    
        i+=1*/
    }


}
//////////Comensales//////////
object mariano{
    const property golosinasCompradas = []

    method comprar(unaGolosina){
        golosinasCompradas.add(unaGolosina)

    }

    method baniar(unaGolosina){
        //if (golosinasCompradas.contains(unaGolosina)){
            return (golosinasCompradas.filter({n => n == unaGolosina}).uniqueElement()) = new baniada()
        
        //unaGolosina = new Baniada()
        
        /*
        
            
            unaGolosina = new Baniada()
            
            golosinasCompradas.forEach({n => if (n == unaGolosina = new Bombon) { unaGolosina = new Baniada()} })
            self.desechar(unaGolosina)
           
            golosinasCompradas.add(new Baniada(gBase1(new Chupetin())))
        }*/
    
    }

    method desechar(unaGolosina){
        golosinasCompradas.remove(unaGolosina)
    }

    method probarGolosinas(){
        golosinasCompradas.forEach({n => n.mordisco()})
    }

    method hayGolosinaSinTACC() =
        golosinasCompradas.any({n => n.glutenFree()})
        
    method preciosCuidados() =
        golosinasCompradas.all({n => n.precio() <= 10})

    method golosinaDeSabor(unSabor) = 
        golosinasCompradas.find({n => n.sabor() == unSabor})

    method golosinasDeSabor(unSabor) =
        golosinasCompradas.filter({n => n.sabor() == unSabor})

    method sabores() =
        (golosinasCompradas.map({n => n.sabor()})).asSet()

    method golosinaMasCara(){
        /*
        var filtrado = 0
        filtrado = (golosinasCompradas.map({n => n.precio()})).max()
        return golosinasCompradas.filter({n => n.precio() == filtrado})
        */
        return golosinasCompradas.max({n => n.precio()})
    }

    method pesoGolosinas() {
        /*var suma = 0
        golosinasCompradas.forEach({n => suma += n.peso()})
        return suma*/
        return golosinasCompradas.sum({n => n.peso()})
    }

    method golosinasFaltantes(golosinasDeseadas) =
        (golosinasDeseadas).difference(golosinasCompradas.asSet())

    method gustosFaltantes(gustosDeseados) = 
        (gustosDeseados).difference(golosinasCompradas.map({ n=> n.sabor()}))
        
}
object juliana{
    const property golosinasDeseadas = #{}
    const property gustosDeseados = #{}
    //{"melón", "chocolate", "frutilla" , "vainilla"}
    method quiereGolosinas(valor){
        golosinasDeseadas.add(valor)
    }

    method taConHambre(){
        return mariano.golosinasFaltantes(self.golosinasDeseadas())
    }

    method quiereGustos(valor){
        gustosDeseados.add(valor)
    }

    method taAntojada(){
        return mariano.gustosFaltantes(self.gustosDeseados())
    }

}
////////////////Sabores///////////
object chocolate{}
object frutilla{}
object naranja{}
object vainilla{}
object melon{}
object sinSabor{}
object vacio{}
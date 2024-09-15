class Golosina{
    var property peso
    var property precio
    method glutenFree() = true

    method mordisco(){
        return true
    }
}

object bombon{
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
object alfajor{
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
object caramelo{
    var property precio = 1
    const property sabor = frutilla
    var property peso = 5
    const property glutenFree = true
    var property contadorMordisco = 0

    method mordisco (){
        peso -= 1
        return peso
    }

}
object chupetin{
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
object oblea{
    var property precio = 5
    var property sabor = vainilla
    var property peso = 250
    const property glutenFree = false
    var property contadorMordisco = 0

    method mordisco (){
        if (peso > 70)
            peso = (peso * 0.5)
        else peso = (peso * 0.25)
    
        return peso
    }

}
object chocolatin{
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
object baniada{
    var property gBase = vacio
    var property precio = 0
    var property sabor = sinSabor
    var property peso = 0
    var property glutenFree = false
    var property baniado = 0

    method gBase(golo1){
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
object pastilla{
    var property precio = 0
    var property sabor = frutilla
    var property peso = 5
    var property glutenFree = vacio
    const property gustos = [chocolate, naranja, frutilla]
    var property i = 0

    method elegirGluten(valor){

        if (valor == true){
            glutenFree = valor
            precio = 7
        }
        if (valor == false){
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
object mariano{
    const property golosinasCompradas = []

    method comprar(unaGolosina){
        golosinasCompradas.add(unaGolosina)

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
class Localidad {
    var ejercito

    method ejercito() = ejercito

    method poderDefensivo() = ejercito.poderOfensivo()

    method serOcupada(unEjercito)
}

class Aldea inherits Localidad { 
    const cantidadMaxHabitantes

    override method serOcupada(unEjercito) {
        if (unEjercito.size() > cantidadMaxHabitantes) {
            ejercito = unEjercito.ejercitoSolo10MasFuertes()
        } else {
            ejercito = unEjercito
        }
    }
}

class Ciudad inherits Localidad {
    override method poderDefensivo() = ejercito.poderOfensivo() + 300

    override method serOcupada(unEjercito) {
        ejercito = unEjercito
    }
}
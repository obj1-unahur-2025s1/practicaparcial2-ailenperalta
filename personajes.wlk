// SUPERCLASE
class Personaje {
    const fuerza 
    const inteligencia 
    var property rol

    method potencialOfensivo() = fuerza * 10 + rol.extra()

    method esGroso() = self.esInteligente() || self.esGrosoEnSuRol()

    method esInteligente() //metodo abstracto

    method esGrosoEnSuRol() = rol.esGroso(self) 
}

// SUBCLASES
class Orco inherits Personaje {
    override method potencialOfensivo() = if (rol == brujo) super() * 1.1 else super()

    override method esInteligente() = false 
}

class Humano inherits Personaje {
    override method esInteligente() = inteligencia > 50
}

// ROLES - OBJETOS
object guerrero {
    method extra() = 100

    method esGroso(unPersonaje) = unPersonaje.fuerza() > 50
}

object brujo {
    method extra() = 0

    method esGroso(unPersonaje) = true 
}

// ROL - CLASE 
class Cazador {
    const property mascota

    method extra() = mascota.extra()

    method esGroso(unPersonaje) = mascota.esLongeva()
}

// CLASE 
class Mascota {
    const property fuerza 
    var edad
    const property tieneGarras

    method edad() = edad 

    method cumplirAños() {
        edad += 1
    }

    method extra() = if (tieneGarras) fuerza * 2 else fuerza 

    method esLongeva() = edad > 10
}

// SUPERCLASE
class Localidad {
    var ejercito

    method ejercito() = ejercito

    method poderDefensivo() = ejercito.poderOfensivo()

    method serOcupada(unEjercito)

}

// SUBCLASES
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

// CLASE
class Ejercito {
    const property personajes = []

    method invadir(unaLocalidad) {
        if (self.puedeInvadir(unaLocalidad)) {
            unaLocalidad.serOcupada(self)
        }
    }

    method poderOfensivo() = personajes.sum({p => p.potencialOfensivo()})

    method puedeInvadir(unaLocalidad) = self.poderOfensivo() > unaLocalidad.poderDefensivo() 

    method ejercitoSolo10MasFuertes() = self.ejercitoOrdenadoMasAMenosFuertes().take(10)

    method ejercitoOrdenadoMasAMenosFuertes() = personajes.sortBy({p1, p2 => p1.potencialOfensivo() > p2.potencialOfensivo()})
}

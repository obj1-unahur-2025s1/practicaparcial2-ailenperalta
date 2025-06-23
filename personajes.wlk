class Personaje {
    const fuerza 
    const property inteligencia 
    var property rol

    method potencialOfensivo() = fuerza * 10 + rol.extra()

    method esGroso() = self.esInteligente() || self.esGrosoEnSuRol()

    method esInteligente() //metodo abstracto

    method esGrosoEnSuRol() = rol.esGroso(self) 
}

class Orco inherits Personaje {
    override method potencialOfensivo() = if (rol.toString() == brujo.toString()) super() * 1.1 else super()

    override method esInteligente() = false 
}

class Humano inherits Personaje {
    override method esInteligente() = inteligencia > 50
}

object guerrero {
    method extra() = 100

    method esGroso(unPersonaje) = unPersonaje.fuerza() > 50
}

object brujo {
    method extra() = 0

    method esGroso(unPersonaje) = true 
}

class Cazador {
    const property mascota

    method extra() = mascota.extra()

    method esGroso(unPersonaje) = mascota.esLongeva()
}

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


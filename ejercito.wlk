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
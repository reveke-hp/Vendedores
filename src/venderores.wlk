

class Vendedor{
	var property viveEn
	var property certificaciones = 0
	var property certificacionesSobreProductos = 0
	var property certificacionesComunes = 0
	method puedeTrabajarEn(unaCiudad){
		return viveEn == unaCiudad
		}
	method esVersatil(){
		return (certificaciones >= 3) or (certificacionesSobreProductos>=1) or (certificacionesComunes >= 1)
	}
	method esFirme(){
		return certificaciones>=30
	}
	method certificacionesEnTotal(){
		certificaciones += certificacionesSobreProductos + certificacionesComunes
	}
	method esInfluyente(){
		return false
	}
}

class VendedorFijo inherits Vendedor{
	override method puedeTrabajarEn(unaCiudad){
		return viveEn == unaCiudad
	}
}

class VendedorViajante inherits Vendedor{
	var property provinciasHabilitadas = []
	override method puedeTrabajarEn(unaCiudad){	
		return provinciasHabilitadas.contains(unaCiudad)
	}
	method agregarHabilitacion(unaProvincia){
		provinciasHabilitadas.add(unaProvincia)
	}
	method sacarHabilitacion(unaProvincia){
		provinciasHabilitadas.remove(unaProvincia)
	}
	override method esInfluyente(){
		return provinciasHabilitadas.sum({provincia => provincia.poblacion()}) >= 10000000
	}
}

class ComercioCorresponsal inherits Vendedor{
	var property tieneSucursalEn = []
	override method puedeTrabajarEn(unaCiudad){
		return tieneSucursalEn.contains(unaCiudad)
	}
	method agregarSucursal(unaCiudad){
		tieneSucursalEn.add(unaCiudad)
	}
	method sacarSucursal(unaCiudad){
		tieneSucursalEn.remove(unaCiudad)
	}
	override method  esInfluyente(){
		return (self.cantidadDeSucursales() > 5) or (self.cantidadDeProvincias() > 3)
	}
	method cantidadDeProvincias(){
		var provincias = tieneSucursalEn.map({ciudad => ciudad.estaEn()})
		return provincias.size()
	}
	method cantidadDeSucursales(){
		return tieneSucursalEn.size()
	}
}


class Ciudad {
	var property estaEn
}

class Provincia {
	var property poblacion
	var property ciudades = []
	method contieneA(unaCiudad){
		ciudades.add(unaCiudad)
	}
	method sacarA(unaCiudad){
		ciudades.remove(unaCiudad)
	}
	method tieneA(unaCiudad){
		ciudades.contains(unaCiudad)
	}
}
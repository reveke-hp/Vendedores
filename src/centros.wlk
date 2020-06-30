

class CentroDeDistribucion{
	var property estaEnLaCiudadDe
	var property trabajaCon = []
	
	method agregarTrabajador(unVendedor){
		if (not trabajaCon.contains(unVendedor)) trabajaCon.add(unVendedor)
		else self.error("Ya esta trabajando")
	}
	method sacarTrabajador(unVendedor){
		if (trabajaCon.contains(unVendedor)) trabajaCon.remove(unVendedor)
		else self.error("No era empleado")
	}
	method vendedorEstrella(){
		return trabajaCon.max({vendedor => vendedor.certificaciones()})
	}
	method puedeCubrir(unaCiudad){
		return trabajaCon.any({vendedor => vendedor.viveEn(unaCiudad)})
	}
	method vendedoresGenericos(){
		return trabajaCon.map({vendedor => vendedor.certificacionesComunes() >= 1})
	}
	method esRobusto(){
		return trabajaCon.count({vendedor => vendedor.esFirme()}) > 3
	}
}
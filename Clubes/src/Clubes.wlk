class Club{
	
	var equipos = #{};
	var socios  = #{};
	var actividadesSociales = #{};
	var property valorPaseEstrella;
	

	method setEquipo(nuevoEquipo){
		equipos.add(nuevoEquipo);	
	}
	method setSocio(nuevoSocio){
		socios.add(nuevoSocio);	
	}

	method getEquipo(){
		return equipos;	
	}
	method getSocio(){
		return socios;	
	}	
	method setActividad(actv){
		actividadesSociales.add(actv);	
	}	
	method getActividad(){
		return actividadesSociales;	
	}	
	
	
	method esSocioEstrella(socio)
	
}

class ClubTradicional inherits Club{
	override method esSocioEstrella(socio){
		return   self.getActividad().filter({act => act.getSocio().contains(socio) }).size() > 2
				 or
				 socio.valorDelPase() > valorPaseEstrella;
				 
	}
}
class ClubComunitario inherits Club{
	override method esSocioEstrella(socio){
		return self.getActividad().filter({act => act.getSocio().contains(socio) }).size() > 2;
	}
}
class ClubProfesional inherits Club{
	override method esSocioEstrella(socio){
		return socio.valorDelPase() > valorPaseEstrella;
	}
}

class Equipo{
	
	var plantel = #{};
	var capitan;
	
	method agregaJugador(jugador){
		plantel.add(jugador);
	}
	method setCapitan(jugador){
		capitan = jugador;
	}
}


class ActividadSocial{
	
	var property socioOrganizador;
	var socios = #{};
	
	method nuevoSocio(socio){
		socios.add(socio);
	}
	method getSocio(){
		return socios;
	}
		
}

class Socio{
	
	var club;
	var property antiguedad;
	
	method esEstrella(){
		return antiguedad > 20;
	}
		
}

class Jugador inherits Socio{
	
	var property valorDelPase;
	var property cantidadDePartidos;
	
	override method esEstrella(){
		return cantidadDePartidos > 50 or 
			   club.esSocioEstrella(self);
	}	
		
}


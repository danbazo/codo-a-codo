/**
 * Esta funcion cambia los elementos de la selección Localidad en el form de pedidos, dependiendo de la selección de Provincia
 */
 
 function cambiarLocalidad(){
	
	let provincia = document.getElementById("provincia");
	let seleccion = provincia.options[provincia.selectedIndex].value;
	
	let localidad =document.getElementsByName(seleccion)
	
	document.getElementById("localidad").innerHTML="<option selected>Seleccione una localidad</option>";
	for (i=0; i<document.getElementsByName(seleccion).length;i++){
		let nombreLocalidad =localidad[i].value;
		let idLocalidad = localidad[i].id;
		document.getElementById("localidad").innerHTML=document.getElementById("localidad").innerHTML + "<option value='" + idLocalidad + "'>" + nombreLocalidad+ "</option>";
	}
	

	
}
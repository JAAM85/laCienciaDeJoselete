// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require moment
//= require popper
//= require bootstrap-sprockets
//= require bootstrap-datetimepicker
//= require tinymce
//= require_tree .

function reload_links(id){
  $('#links').html("");
  var url = "/reload_links";

  $.ajax({                        
     type: "POST",                 
     url: url,                     
     data: {"id": id}, 
     success: function(data)             
     {
       $('#links').html(data);               
     }
 });
}

function reload_trabajos(date){
  console.log(date);
  $('#tablaTrabajos').html("");
  var url = "/reload_trabajos";

  $.ajax({                        
     type: "POST",                 
     url: url,                     
     data: {"date": date}, 
     success: function(data)             
     {
       $('#tablaTrabajos').html(data);               
     }
 });
}

function edit_tema(tema){

  $('#tema').html("");
  var url = "/edit_tema";

  $.ajax({                        
     type: "POST",                 
     url: url,                     
     data: {"tema": tema}, 
     success: function(data)             
     {
       $('#tema').html(data);               
     },
     error:function(data)  
     {
       console.log(data);
     }
 });
} 

function edit_trabajo(t){

  $('#trabajo').html("");
  var url = "/edit_trabajo";

  $.ajax({                        
     type: "POST",                 
     url: url,                     
     data: {"trabajo": t}, 
     success: function(data)             
     {
       $('#trabajo').html(data);               
     },
     error:function(data)  
     {
       console.log(data);
     }
 });
} 

function edit_control(c){

  $('#control').html("");
  var url = "/edit_control";

  $.ajax({                        
     type: "POST",                 
     url: url,                     
     data: {"control": c}, 
     success: function(data)             
     {
       $('#control').html(data);               
     },
     error:function(data)  
     {
       console.log(data);
     }
 });
} 

function edit_actividad(actividad){

  $('#actividad').html("");
  var url = "/edit_actividad";

  $.ajax({                        
     type: "POST",                 
     url: url,                     
     data: {"actividad": actividad}, 
     success: function(data)             
     {
       $('#actividad').html(data);               
     },
     error:function(data)  
     {
       console.log(data);
     }
 });
}

function edit_noticia(n){

  $('#noticia').html("");
  var url = "/edit_noticia";

  $.ajax({                        
     type: "POST",                 
     url: url,                     
     data: {"noticia": n}, 
     success: function(data)             
     {
       $('#noticia').html(data);               
     },
     error:function(data)  
     {
       console.log(data);
     }
 });
}

function delete_contenido(contenido, id){
  $('#btnDelete').html("Espere un momento...");
  var url = "/delete_"+contenido;

  $.ajax({                        
     type: "POST",                 
     url: url,                     
     data: {"id": id}, 
     success: function(data)             
     {
       window.location.reload();              
     },
     error:function(data)  
     {
       console.log(data);
     }
 });
}

function destroyControl(event){
	var button = $(event) // Button that triggered the modal
  var recipient = button.data('id') // Extract info from data-* attributes
  var mensaje = button.data('mensaje');
  var tipoContenido = button.data('contenido');

  $('#mContenido').html(mensaje);
  
  var button1 = document.createElement("button");
    button1.type = "button";
    button1.innerHTML= 'Si, eliminar';
    button1.className = "btn btn-danger";
    button1.setAttribute("onclick","delete_contenido('"+tipoContenido+"', "+recipient+")");

	$('#btnDelete').html(button1);

	$('#mQuestion').modal('show');
}

function loadScript(url, callback){

  var script = document.createElement("script")
  script.type = "text/javascript";

  if (script.readyState){  //IE
      script.onreadystatechange = function(){
          if (script.readyState == "loaded" ||
                  script.readyState == "complete"){
              script.onreadystatechange = null;
              callback();
          }
      };
  } else {  //Others
      script.onload = function(){
          callback();
      };
  }

  script.src = url;
  document.getElementsByTagName("head")[0].appendChild(script);
}


/* 
 * Archivo Creado por el Ing. Angel Gonzalez
 * correo angeledugo@gmail.com
 */
$(document).ready(function(){
  $('#btn_modificar').click(function(){
    $('input[type="text"]').removeAttr('disabled');
    $('textarea').removeAttr('disabled');
    
  });
})


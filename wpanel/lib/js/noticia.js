/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//cargando el fckeditor
window.onload = function() 
{ 
var oFCKeditor = new FCKeditor( 'txt_conten' ) ; 
oFCKeditor.ReplaceTextarea() ; 
} 

$(document).ready(function(){
    //habilitando el formulario para agregar las noticias
    $('#btn_agregar').click(function(){
        $('#forma_noticia').animate({
        left: '+=50',
        height: 'toggle'
        }, 1000, function() {
        // Animation complete.
        });
    });
});
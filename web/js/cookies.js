/*
 * funciones para controlar las cookies y mostrar o no mostrar el velo con el texto informativo del uso de cookies
 */

function GetCookie(name) {
    var arg=name+"=";
    var alen=arg.length;
    var clen=document.cookie.length;
    var i=0;
 
    while (i<clen) {
        var j=i+alen;
 
        if (document.cookie.substring(i,j)==arg)
            return "1";
        i=document.cookie.indexOf(" ",i)+1;
        if (i==0)
            break;
    }
 
    return null;
}
 
function aceptar_cookies(){
    var expire=new Date();
    //expire=new Date(expire.getTime()+110000000);
    expire=new Date(expire.getTime()+800000);  //unos 15 minutos de vida
    document.cookie="cookies_mostrar_velo=aceptada; expires="+expire;
 
    var visit=GetCookie("cookies_mostrar_velo");
 
    if (visit==1){
        popbox3();
    }
}
 
$(function() {
    var visit=GetCookie("cookies_mostrar_velo");
    if (visit==1){ popbox3(); }
});
 
function popbox3() {
    $('.cookies').toggle();
}
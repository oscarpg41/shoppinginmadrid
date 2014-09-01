/*
 * muestra / oculta los submenus del menu lateral del panel de administración
 */
    function mostrarSubmenu(){
        $("ul.submenu").stop().slideUp('slow');
        $('a').removeClass('seleccionado');
        $(this).addClass('seleccionado');
        $(this).parent().find("ul.submenu").stop().slideDown('slow');
    }
    

/*
 * muestra el submenuArea cuando se cargan los jsp de las operaciones relativas a las difenentes áreas comerciales
 */
    function mostrarSubMenuArea(){
        $('.areamenu a:first').addClass('seleccionado');
        $('.areamenu ul').show();        
    }
    function mostrarSubMenuStreet(){
        $('.streetmenu a:first').addClass('seleccionado');
        $('.streetmenu ul').show();        
    }    
    function mostrarSubMenuTypeShop(){
        $('.typeshop a:first').addClass('seleccionado');
        $('.typeshop ul').show();        
    }
    function mostrarSubMenuDepartment(){
        $('.department a:first').addClass('seleccionado');
        $('.department ul').show();        
    }
    function mostrarSubMenuMall(){
        $('.malls a:first').addClass('seleccionado');
        $('.malls ul').show();        
    }    
    function mostrarSubMenuMarket(){
        $('.markets a:first').addClass('seleccionado');
        $('.markets ul').show();        
    }
    function mostrarSubMenuShop(){
        $('.shops a:first').addClass('seleccionado');
        $('.shops ul').show();        
    }

/*
 * Funciones para recargar el valor del input=areaName
 * Usamos ajax para modificar el input despues de que se cambie el valor del select
 */
 function cambiaSelectAreaByAjax(){
    var idArea = $("#idArea").val();
    $.ajax({
        url: '/shopMadrid/admin/getAreaAction.do', 
        data: 'idArea='+idArea,
        success: modificarInputArea
    });
 }
 function modificarInputArea(data){
    var respuesta = data.areaName.trim();   $("#name").val(respuesta);
    respuesta= data.descriptionEs.trim();   $("#descriptionEs").val(respuesta);
    respuesta= data.descriptionEn.trim();   $("#descriptionEn").val(respuesta);
    
    $("#name").prop('disabled', false);
    $("#descriptionEs").prop('disabled', false);
    $("#descriptionEn").prop('disabled', false);
 } 



/*
 * Funciones para recargar el select de las calles cuando se cambie el valor del select del area
 * en la pagina shopListByStreet.jsp (en la operativa de actualizar tienda)
 */
 function cambiaSelectStreetByAjax(){
    var idArea = $("#idArea").val();
    $.ajax({
        url: '/shopMadrid/admin/getStreetAction.do', 
        data: 'idArea='+idArea,
        success: modificarSelectStreet
    });
 }
 function modificarSelectStreet(data){
    $("#idStreet").prop('disabled', false);
    var respuesta = data.trim();
    $("#idStreet").html(respuesta);
    loadShopsByAjax();
 }


/*
 * Funciones para recargar el input=select donde se muestran las calles de un area
 * Usamos ajax para modificar el input despues de que se cambie el valor del select
 */
 function cambiaInputStreetByAjax(){
    var idArea = $("#idArea").val();
    $.ajax({
        url: '/shopMadrid/admin/getStreetAction.do', 
        data: 'idArea='+idArea,
        success: modificarInputStreet
    });
 }
 function modificarInputStreet(data){
    var respuesta = data.trim();
    $("#idStreet").html(respuesta);
    $("#idStreet").prop('disabled', false);
    var valor = $("#idStreet option:selected").html();
    $("#name").prop('disabled', false);
    $("#name").val(valor);
 }



/*
 * Funciones para recargar los nombres(español e ingles) de la categoria seleccionada.
 * Usamos ajax para modificar el input despues de que se cambie el valor del select
 */
 function cambiaInputTypeShopByAjax(){
    var idType = $("#idType").val();
    $.ajax({
        url: '/shopMadrid/admin/getTyeShopsAction.do', 
        data: 'idType='+idType,
        success: modificarInputTypeShop
    });
 }
 function modificarInputTypeShop(data){
    var respuesta= data.typeShopNameEs.trim();  $("#name_es").val(respuesta);
    respuesta= data.typeShopNameEn.trim();      $("#name_en").val(respuesta);
    
    $("#name_es").prop('disabled', false);
    $("#name_en").prop('disabled', false);
 }


/*
 * Funciones para recargar los input de la pagina mallUpdate.jsp
 * Usamos ajax para modificar el input despues de que se cambie el valor del select
 */
 function cambiaMallByAjax(){
    var idMall = $("#idMall").val();
    
    $.ajax({
        url: '/shopMadrid/admin/getMallAction.do', 
        data: 'idMall='+idMall,
        success: modificarInputMall
    });
 }
 function modificarInputMall(data){
    var respuesta= data.name.trim();        $("#name").val(respuesta);
    respuesta= data.street.trim();          $("#street").val(respuesta);    
    respuesta= data.zip.trim();             $("#zip").val(respuesta);
    respuesta= data.web.trim();             $("#web").val(respuesta);
    respuesta= data.maps.trim();            $("#maps").val(respuesta);    
    respuesta= data.metro.trim();           $("#metro").val(respuesta);       
    respuesta= data.number.trim();          $("#number").val(respuesta);
    respuesta= data.descriptionEs.trim();   $("#descriptionEs").val(respuesta);
    respuesta= data.descriptionEn.trim();   $("#descriptionEn").val(respuesta);
    
    respuesta = '<img id="image" src="../images/malls/' + data.imagen.trim() +'" width="300px" />';
    $(".imagen").html(respuesta);
    
    
    $("#name").prop('disabled', false);
    $("#street").prop('disabled', false);
    $("#zip").prop('disabled', false);
    $("#web").prop('disabled', false);
    $("#metro").prop('disabled', false);
    $("#number").prop('disabled', false);
    $("#descriptionEs").prop('disabled', false);
    $("#descriptionEn").prop('disabled', false);
 }

/*
 * Funciones para recargar los input de la pagina marketUpdate.jsp
 * Usamos ajax para modificar el input despues de que se cambie el valor del select
 */
 function cambiaMarketByAjax(){
    var idMarket = $("#idMarket").val();
    $.ajax({
        url: '/shopMadrid/admin/getMarketAction.do', 
        data: 'idMarket='+idMarket,
        success: modificarInputMarket
    });
 }
 function modificarInputMarket(data){
    var respuesta= data.name.trim();        $("#name").val(respuesta);
    respuesta= data.street.trim();          $("#street").val(respuesta);    
    respuesta= data.zip.trim();             $("#zip").val(respuesta);
    respuesta= data.web.trim();             $("#web").val(respuesta);
    respuesta= data.maps.trim();            $("#maps").val(respuesta);
    respuesta= data.metro.trim();           $("#metro").val(respuesta);       
    respuesta= data.number.trim();          $("#number").val(respuesta);
    respuesta= data.descriptionEs.trim();   $("#descriptionEs").val(respuesta);
    respuesta= data.descriptionEn.trim();   $("#descriptionEn").val(respuesta);
    
    respuesta = '<img id="image" src="../images/markets/' + data.imagen.trim() +'" width="300px" />';
    $(".imagen").html(respuesta);
    
    
    $("#name").prop('disabled', false);
    $("#street").prop('disabled', false);
    $("#zip").prop('disabled', false);
    $("#web").prop('disabled', false);
    $("#metro").prop('disabled', false);
    $("#number").prop('disabled', false);
    $("#descriptionEs").prop('disabled', false);
    $("#descriptionEn").prop('disabled', false);
 }



/*
 * cargamos el listado de tiendas en la pagina de admin/shopListByStreet.jsp
 */
 function loadShopsByAjax(){
    var idStreet = $("#idStreet").val();
    $.ajax({
        url: '/shopMadrid/admin/shopListAction.do', 
        data: 'idStreet='+idStreet,
        success: loadListShops
    });
 }
 function loadListShops(data){
    var respuesta = data.trim();
    $(".listado").html(respuesta);
    $(".listado .row:odd").css("background-color", "#E6E6FA"); // filas pares
    $(".formulario:odd").css("display", "block");
 }


/*
 * función que llama al action shopDeleteAction.do pasándo el idShop para eliminar la tienda
 */
function sendShopToDelete(){
    if (confirm('¿Estas seguro de borrar el elemento seleccionado?')) { 
        var idShop = $("#idShop").val();
        var url = '/shopMadrid/admin/shopDeleteAction.do?idShop='+idShop;
        $(location).attr('href',url);
    }    
}


/*
 * Confirmamos el Borrado de un elemento
 */        
 function confirmarBorrado(e){
    if (confirm('¿Estas seguro de borrar el elemento seleccionado?')) { 
        $('#formInformation').submit();
        return true;
    }
    else{
        return false;
    }
 }
 
 /*
  * Cerramos la ventana modal que muestra el resultado de las operaciones
  */
 function cierraModal () {
    $(".modal").css("display", "none");
    $('.modal').remove();
    e.preventDefault();
}

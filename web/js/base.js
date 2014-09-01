/**
 * Base js functions
 */

/**
 * Es el codigo para ejecutar el plugin masonry 
 */
      
  function loadMasonry(){
    var $container = $('.container');

    var gutter = 30;
    var min_width = 300;
    $container.imagesLoaded( function(){
        $container.masonry({
            itemSelector : '.box',
            gutterWidth: gutter,
            isAnimated: true,
              columnWidth: function( containerWidth ) {
                var box_width = (((containerWidth - 2*gutter)/3) | 0) ;

                if (box_width < min_width) {
                    box_width = (((containerWidth - gutter)/2) | 0);
                }

                if (box_width < min_width) {
                    box_width = containerWidth;
                }

                $('.box').width(box_width);

                return box_width;
              }
        });
    });
};

//lamamos a la función loadMasonry cada vez que se carga la pagina
$(document).ready(loadMasonry);


/**
 * Muestra/oculta el menu cabecera para los dispositivos móviles
 */
function toggleMenu(){
    
    if(typeof(menuIsOpen) == "undefined"){ menuIsOpen = false; }
    
    if(menuIsOpen){
        $(".nav").slideUp(600);
	$(".btn-menu").css('background', 'url("images/btn-openmenu.png") right no-repeat');
    }
    else
    {
	$(".nav").slideDown(600);
        $(".btn-menu").css('background', 'url("images/btn-closemenu.png") right no-repeat');
    }
			
    menuIsOpen = !menuIsOpen;
    return false
}

 /*
  * Cerramos la ventana modal que muestra el resultado de las operaciones
  */
 function cierraModal () {
    $(".modal").css("display", "none");
    $('.modal').remove();
    e.preventDefault();
}



/*
 * S H O P P I N G   A R E A S
 * R E C U P E R A R   Y   M O S T R A R   L A   I N F O R M A C I O N
 * P A G I N A C I O N   D E   L A S   T I E N D A S
 * pag: areas.jsp
 */

/*
 * Cambiamos el select de las calles cuando se cambia el area
 * llamamos al metodo /shopMadrid/admin/getStreetAction.do para recuperar las calles del area
 */
 function cambiaSelectStreetByAjax(){
    var idArea = $("#idArea").val();
    
    $.ajax({
        url: '/shopMadrid/admin/getStreetAction.do', 
        data: 'idArea='+idArea,
        success: modificarSelectStreet
    });
 }
 /*
  * - se activan los select de calles y categorias de tiendas
  * - se carga el select de la calle con la informacion que se ha recuperado de la funcion anterior
  * - llamamos a la funcion loadShopsByAjax()
  */
 function modificarSelectStreet(data){
    $("#idStreet").prop('disabled', false);
    $("#idType").prop('disabled', false);    
    var respuesta = data.trim();
    $("#idStreet").html(respuesta);
    goPage(1);
 }
 
 
 
/*
 * Se ejecuta cuando se cambia el valor de los select de la calle o de la categoria en areas.jsp.
 * Es necesario poner a 1 el valor de la pagina para empezar desde el principio la paginacion
 */ 
function selectsIsChanged(){
    goPage(1);
}

 /*
  * funcion para cargar una página definida por el parámetro num en la paginación de las tiendas
  * llama a la funcion loadShopsPublicByAjax() que es la encargada de realizar 
  * la petición ajax al servidor y recuperar la información de las tiendas
  */
 function goPage(num){
     $("#numPage").val(num);
     loadShopsPublicByAjax();
 }


/* 
 * Recuperamos la información de las tiendas de la pagina search.jsp
 * Realiza una petición ajax pasándo tres parámetros: name, idType y numPage
 */
 function goPageSearch(num){
     $("#numPage").val(num);
     loadShopsSearchFormByAjax();
 }
 function loadShopsSearchFormByAjax(){
    var parametros = {
        "texto"   : $("#texto").val(),
        "idType"  : $("#idType").val(),
        "numPage" : $("#numPage").val()        
    };    
    $.ajax({
        url: '/shopMadrid/searchShops.do', 
        data: parametros,
        type: 'post',
        beforeSend: function () {
            $(".listado").html("<div class='message message-info'>Processing, wait please...</div>");
        },
        success: loadListShops
    });
 }
/* 
 * Recuperamos la información de las tiendas de la pagina areas.jsp
 * Realiza una petición ajax pasándo tres parámetros: idStreet, idType y numPage
 */
 function loadShopsPublicByAjax(){
    var parametros = {
        "idStreet" : $("#idStreet").val(),
        "idType" : $("#idType").val(),
        "numPage" : $("#numPage").val()        
    };    
    $.ajax({
        url: '/shopMadrid/shopListPublicAction.do', 
        data: parametros,
        type: 'post',
        beforeSend: function () {
            $(".listado").html("<div class='message message-info'>Processing, wait please...</div>");
        },
        success: loadListShops
    });
 }
 function loadListShops(data){
    var respuesta = data.trim();
    $(".listado").html(respuesta);
    loadMasonry();
 }

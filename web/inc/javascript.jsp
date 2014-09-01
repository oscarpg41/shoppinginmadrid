    <script src="js/libs/jquery.js"></script>
    <script src="js/base.js" type="text/javascript"></script>
    <script src="js/cookies.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(".nav").css("display", "none");

	//var menuIsOpen = false;
        
        $(".btn-menu").on("click", toggleMenu);
	$('.cookies .close').on('click', aceptar_cookies);
        
        
        
        //se muestra el div de las banderas
        $(".languageLink").click(function(){
            $(".languages").toggle()
        });
        
        $(".languageLink, .languages").live("mouseleave",
            function(a){
                $(a.relatedTarget).parents(".languageArea").length==0&&$(".languages").hide()
            }
        );
    
        //var prefixAction = "shopMadrid/"; //DESARROLLO
        var prefixAction = ""; //PRODUCCION
        var languageSpain = '<a href="'+ prefixAction +'selectedlanguage.do?method=spanish"><img src="images/iconos/spain.gif" alt="Spanish"></a>';
        var languageUK    = '<a href="'+ prefixAction +'selectedlanguage.do?method=english"><img src="images/iconos/uk.gif" alt="English"></a>';
        var flagSpain     = '<img src="images/iconos/spain.gif" alt="Spanish">';
        var flagUK        = '<img src="images/iconos/uk.gif" alt="English">';
 
        
 <% if (request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("en")){%>
        $(".languageLink").html(flagUK);
        $(".languages").html(languageSpain);
 <% }else{ %>    
        $(".languageLink").html(flagSpain);
        $(".languages").html(languageUK);
<% }%>
        

    </script>
    

<!doctype html>
<%@include file="inc/main.jsp" %>
<html lang="en">
<head>
    <%@include file="inc/head.jsp" %> 
</head>
<body>

    <div class="cookies"><%@include file="inc/cookies.jsp" %></div>    

    <header><%@include file="inc/header.jsp" %></header>

    <nav><%@include file="inc/menu.jsp" %></nav>


    <div class="wrapper">

        <div class="porque"><bean:message key="index_public_porque"/></div>

        <div class="main-img"><img src="images/index/index.jpg" class="pic"></div>

        <div class="separador"></div>


	<div class="container">

            <div class="box">
                <div class="article">
                    <html:link forward="menu_public_areas"><h2><bean:message key="menu_public_areas"/></h2>
	            <img alt="author:Nuria Molla" class="thumbnail" src="images/index/preciados.jpg"></html:link>
	            <bean:message key="index_best_shopping_places" />
                </div>
	    </div>

            <div class="box">
                <div class="article">
                    <html:link forward="menu_public_malls"><h2><bean:message key="menu_public_malls"/></h2>
	            <img alt="Shopping Mall" class="thumbnail" src="images/index/pasillo.jpg"></html:link>
	            <bean:message key="index_malls_accesible_by_tube" />
                </div>
	    </div>


	    <div class="box">       
                <div class="article">
                    <html:link forward="menu_public_stores"><h2><bean:message key="menu_public_stores"/></h2>
	            <img alt="Department Store: El Corte Inglés" class="thumbnail" src="images/index/corte-ingles.jpg">
	            <h4><bean:message key="index_corte_ingles" /></h4></html:link>
	            <bean:message key="index_corte_ingles_desc" />
	        </div>
	    </div>

	    <div class="box">       
                <div class="article">
                    <html:link forward="rastro"><h2><bean:message key="index_el_rastro"/></h2>
	            <img alt="Madrid Markets: El Rastro" class="thumbnail" src="images/index/rastro_de_Madrid.jpg"></html:link>
	            <bean:message key="index_el_rastro_desc" />	                
	        </div>
	    </div>

	    <div class="box">       
                <div class="article">
                    <html:link forward="menu_public_markets"><h2><bean:message key="index_public_markets"/></h2>
	            <img alt="Madrid Municipal Markets" class="thumbnail" src="images/index/mercado-de-san-miguel-2.jpg"></html:link>
                    <bean:message key="index_municipal_markets" />
	        </div>
	    </div>

	    <div class="box">
                <div class="article">
                     <html:link forward="menu_public_stores"><h2><bean:message key="index_outside_areas"/></h2>
                    <img class="thumbnail" src="images/index/rozasvillage.jpg"></html:link>
                    <bean:message key="index_outside_areas_desc" />
                </div>
	    </div>
	         
        </div> <!-- /container -->

    </div> <!-- /wrapper -->  

	

    <div class="footer"><%@include file="inc/footer.jsp" %></div>

    <!--   J A V A S C R I P T   -->
    <%@include file="inc/javascript.jsp" %>

    <script src="js/libs/jquery.masonry.min.js"></script>
    
</body>
</html>
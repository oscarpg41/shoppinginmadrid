<!doctype html>
<%@include file="inc/main.jsp" %>
<html lang="en">
<head>
    <%@include file="inc/head.jsp" %> 
</head>
<body>

    <div class="cookies">
        <%@include file="inc/cookies.jsp" %>
    </div>    

    <header>
        <%@include file="inc/header.jsp" %>
    </header>

    <nav>
        <%@include file="inc/menu.jsp" %>
    </nav>

    <div class="wrapper">

        <h2><bean:message key="menu_public_areas"/></h2>        
        
        <div class="selectShoppingAreas">
            <div class="container">                
                <div class="box">
                    <p class="labelList"><bean:message key="admin.area.select.label"/></p>
                    <select name="idArea" id="idArea" required>
                        <option></option>
                        <%=listadoAreas%>
                    </select>
                </div>

                <div class="box">
                    <p class="labelList"><bean:message key="admin.street.select.label"/></p>
                    <select name="idStreet" id="idStreet" required disabled></select>
                </div>

                <div class="box">
                    <p class="labelList"><bean:message key="admin.typeShop.select.label"/></p>
                    <select name="idType" id="idType" required disabled>
                        <option></option>
                        <%=listadoTypeShops%>
                    </select>
                    <input type="hidden" name="numPage" id="numPage" value="1">
                </div>
                    
            </div>
        </div>


        
        <div class="listado"></div>
                    
    </div> <!-- /wrapper -->  

	

    <div class="footer">
         <%@include file="inc/footer.jsp" %>
    </div>

    <!--   J A V A S C R I P T   -->
    <%@include file="inc/javascript.jsp" %>
    <script src="js/libs/jquery.masonry.min.js"></script>
    <script>    
        //cambiamos el valor del select de las calles mediante ajax
        $('#idArea').on('change', cambiaSelectStreetByAjax);
        //recuperamos las tiendas de la calle y cargamos el listado en la pagina
        $('#idStreet').on('change', selectsIsChanged);
        $('#idType').on('change', selectsIsChanged);
    </script>
</body>
</html>
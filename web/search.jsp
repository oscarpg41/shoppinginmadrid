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

        <h2><bean:message key="menu_public_search"/></h2>        
        
        <div class="formulario">
            <div class="fila">
                <p>&nbsp;</p>
                <input type="text" id="texto" name="texto" placeholder="<bean:message key="search.label"/>">
            </div>

            <div class="fila">
                <p><bean:message key="admin.typeShop.select.label"/></p>
                <select name="idType" id="idType">
                    <option></option>
                    <%=listadoTypeShops%>
                </select>
                <input type="hidden" name="numPage" id="numPage" value="1">
            </div>

            <div class="fila-submit">
                <html:submit property="submit" styleId="submit">
                    <bean:message key='search.label'/>
                </html:submit> 
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
        //recuperamos las tiendas de la calle y cargamos el listado en la pagina
        $('#submit').on('click', loadShopsSearchFormByAjax);
    </script>
</body>
</html>
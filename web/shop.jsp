<!doctype html>
<%@page import="com.java.shopping.madrid.models.Shops"%>
<%@page import="com.java.shopping.madrid.utils.Utilities"%>
<%@include file="inc/main.jsp"%>
<%
    Shops infoShop = new Shops();
    String areaName = "";
    String streetName = "";
    String typeShopName = "";
    
    //Instanciamos la clase Utilities
    Utilities utility= new Utilities();
    try{
        //informacion de la tienda
        infoShop = (Shops)request.getSession().getAttribute(Constants.infoShop);
        areaName   = utility.getArea(infoShop.getIdArea()).getName();
        streetName = utility.getStreet(infoShop.getIdStreet()).getName();
        
        if (request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("es")){
            typeShopName = utility.getTypeShopById( infoShop.getIdType()).getName_es();
        }else{
            typeShopName = utility.getTypeShopById( infoShop.getIdType()).getName_en();
        }
    }
    catch (Exception ex){
        response.sendRedirect("index.jsp");        
    }    
%>
<html lang="en">
<head>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Shopping in Madrid</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

    <div class="cookies"><%@include file="inc/cookies.jsp" %></div>    

    <header><%@include file="inc/header.jsp" %></header>

    <nav><%@include file="inc/menu.jsp" %></nav>



    <div class="wrapper">
         <h2><%=infoShop.getName()%></h2>

        <div class="img_objeto">
            <img alt="<%=infoShop.getName()%>" class="thumbnail" src="images/shops/<%=infoShop.getIdShop()%>.jpg">
        </div>
        
        <div class="info_objeto">

            <div class="info_objeto_line">
                <b><bean:message key="category.label"/></b>: <%=typeShopName%>
            </div> 
            
            <div class="info_objeto_line">
                <b><bean:message key="area.label"/></b>: <%=areaName%>
            </div>            
            
            <div class="info_objeto_line">
                <b><bean:message key="admin.street.select.label"/></b>: <%=streetName%>
                <%=infoShop.getNumber()%>
            </div>

            <div class="info_objeto_line">
                <b><bean:message key="admin.metro.label"/>:</b>
                <%=infoShop.getMetro()%>
                <a href="<%=Constants.URL_PDF_METRO_MADRID%>" target="_blank"><img alt="Metro Madrid" class="thumbnail" src="images/misc/metro.png"></a>
            </div>

            <div class="info_objeto_line">
                <b><bean:message key="admin.web.label"/>:</b>
                <a href="<%=infoShop.getWeb()%>" target="_blank"><%=infoShop.getWeb()%></a>
            </div>
        </div>
            

    </div> <!-- /wrapper -->       
    
    

    <div class="footer">
         <%@include file="inc/footer.jsp" %>
    </div>

    <!--   J A V A S C R I P T   -->
    <%@include file="inc/javascript.jsp" %>
    <script src="js/libs/jquery.masonry.min.js"></script>

</body>
</html>
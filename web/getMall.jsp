<!doctype html>
<%@page import="com.java.shopping.madrid.models.Mall"%>
<%@page import="com.java.shopping.madrid.utils.Utilities"%>
<%@include file="inc/main.jsp"%>
<%
    Mall infoMall = new Mall();
    String descr = "";
    try{
        //informacion de la tienda
        infoMall = (Mall)request.getSession().getAttribute(Constants.infoMall);
        
        //dependiendo del idioma mostramos una descripción u otra
        if (request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("en")){
            descr = infoMall.getDescriptionEn();        
        }else{
            descr = infoMall.getDescriptionEs();
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
         <h2><%=infoMall.getName()%></h2>
         
        <div class="img_objeto">
            <img alt="<%=infoMall.getName()%>" class="thumbnail" src="images/malls/<%=infoMall.getIdMall()%>.jpg">
        </div>
        
        <div class="info_objeto">
 
            <div class="info_objeto_line">
                <%=descr%>
            </div>

            <div class="info_objeto_line">
                <b><bean:message key="admin.street.select.label"/></b>: <%=infoMall.getStreet()%>
                <%=infoMall.getNumber()%>. <%=infoMall.getZip()%>    
            </div>

            <div class="info_objeto_line">
                <b><bean:message key="admin.metro.label"/>:</b>
                <%=infoMall.getMetro()%>
                <a href="<%=Constants.URL_PDF_METRO_MADRID%>" target="_blank"><img alt="Metro Madrid" class="thumbnail" src="images/misc/metro.png"></a>
            </div>

            <div class="info_objeto_line">
                <b><bean:message key="admin.web.label"/>:</b>
                <a href="<%=infoMall.getWeb()%>" target="_blank"><%=infoMall.getWeb()%></a>
            </div>
        </div>
            
        <%if (infoMall.getMaps().length()>0){%>
            <iframe src="<%=infoMall.getMaps()%>" class="maps"></iframe>
        <%}%>

    </div> <!-- /wrapper -->  

    <div class="footer">
         <%@include file="inc/footer.jsp" %>
    </div>

    <!--   J A V A S C R I P T   -->
    <%@include file="inc/javascript.jsp" %>
    <script src="js/libs/jquery.masonry.min.js"></script>

</body>
</html>


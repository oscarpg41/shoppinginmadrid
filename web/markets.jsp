<!doctype html>
<%@page import="java.util.Iterator"%>
<%@page import="com.java.shopping.madrid.models.Markets"%>
<%@page import="java.util.List"%>
<%@page import="com.java.shopping.madrid.utils.Utilities"%>
<%@page import="org.apache.struts.Globals"%>
<%@include file="inc/main.jsp"%>
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
        <h2><bean:message key="menu_public_markets"/></h2>

        <div class="container">
        <%
            //Instanciamos la clase Utilities
            Utilities utility= new Utilities();   
    
            List<Markets> listMall = utility.getMarkets();
            
            Iterator iter = listMall.iterator();
            while (iter.hasNext()){
                Markets b = (Markets) iter.next();
                
                //dependiendo del idioma mostramos una descripción u otra
                String descr = b.getDescriptionEn();
                if (request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("es")){
                    descr = b.getDescriptionEs();
                }
        %>

            <div class="box">
                <div class="article">
                    <!-- /shopMadrid/marketGetAction.do?idMarket=   PARA DESARROLLO -->
                    <h2><a href='/marketGetAction.do?idMarket=<%=b.getIdMarket()%>'><%=b.getName()%></h2>
                    <img alt="<%=b.getName()%>" class="thumbnail" src="images/markets/<%=b.getIdMarket()%>.jpg"></a>
                    <p><%=descr%></p>
                </div>
	    </div>                
        <%
            }
        %>
        
        </div> <!-- /container -->

    </div> <!-- /wrapper -->  

    <div class="footer">
         <%@include file="inc/footer.jsp" %>
    </div>

    <!--   J A V A S C R I P T   -->
    <%@include file="inc/javascript.jsp" %>
    <script src="js/libs/jquery.masonry.min.js"></script>

</body>
</html>


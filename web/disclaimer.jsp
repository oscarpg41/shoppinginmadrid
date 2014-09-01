<!doctype html>
<%@include file="inc/main.jsp" %>
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

    <div class="cookies">
        <%@include file="inc/cookies.jsp" %>
    </div>    

    <header>
        <%@include file="inc/header.jsp" %>
    </header>

    <nav>
        <%@include file="inc/menu.jsp" %>
    </nav>

    <div class="disclaimer">

        <h2><bean:message key="disclaimer.title"/></h2>
        
        <bean:message key="disclaimer.art1"/>

        <bean:message key="disclaimer.art2"/>

            <bean:message key="disclaimer.art2.1"/>

            <bean:message key="disclaimer.art2.2"/>
		
            <bean:message key="disclaimer.art2.3"/>

            <bean:message key="disclaimer.art2.4"/>

    </div> <!-- /wrapper -->  

	

    <div class="footer">
         <%@include file="inc/footer.jsp" %>
    </div>

    <!--   J A V A S C R I P T   -->
    <%@include file="inc/javascript.jsp" %>

    <script src="js/libs/jquery.masonry.min.js"></script>
    
</body>
</html>
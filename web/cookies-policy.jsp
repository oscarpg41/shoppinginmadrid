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

    <header>
        <%@include file="inc/header.jsp" %>
    </header>


    <div class="wrapper cookies-policy">

        <h2><bean:message key="cookies.title"/></h2>
        
        <bean:message key="cookies.paragraph.1"/>

        <bean:message key="cookies.paragraph.2"/>

        <bean:message key="cookies.paragraph.3"/>

        <bean:message key="cookies.paragraph.4"/>

        <bean:message key="cookies.paragraph.5"/>

        <bean:message key="cookies.paragraph.6"/>
        <bean:message key="cookies.paragraph.6.1"/>
        
        <bean:message key="cookies.paragraph.7"/>
        <bean:message key="cookies.paragraph.7.1"/>
        <bean:message key="cookies.paragraph.7.2"/>

        <bean:message key="cookies.paragraph.8"/>
        <bean:message key="cookies.paragraph.8.1"/>
        <bean:message key="cookies.paragraph.8.2"/>
        <bean:message key="cookies.paragraph.8.3"/>        
        
        
        
    </div> <!-- /wrapper -->  

	

    <div class="footer">
         <%@include file="inc/footer.jsp" %>
    </div>

    <!--   J A V A S C R I P T   -->
    <%@include file="inc/javascript.jsp" %>

    <script src="js/libs/jquery.masonry.min.js"></script>
    
</body>
</html>
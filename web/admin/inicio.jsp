<!DOCTYPE html>
<%@page import="com.java.shopping.madrid.models.Login"%>
<%@page import="com.java.shopping.madrid.utils.Constants"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%
    //recuperamos el userLogin de la sesion. Se ha guardado en LoginAction
    Login login     = (Login)request.getSession().getAttribute(Constants.userLogin);
    String userName = login.getName();
%>    
<html:html lang="true">
    <head>
        <%@include file="inc/head.jsp" %>
    </head>
    <body>
        
        <header>
            <h2><bean:message key="name.web"/></h2>
            <div class="name">
                Bienvenido <%=userName%>
            </div>
        </header>          

        <div class="admin_content">
            
            <%@include file="inc/menu.jsp" %>

            <div class="admin_work">
                <bean:message key="admin.welcome"/>
            </div>
        </div>
    
        <%@include file="inc/javascript.jsp" %>

    </body>
</html:html>

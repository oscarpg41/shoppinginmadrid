<%@page import="com.java.shopping.madrid.models.Login"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%
    String userName = "";
    try{
        //recuperamos el userLogin de la sesion. Se ha guardado en LoginAction
        Login login = (Login)request.getSession().getAttribute("userLogin");
        userName    = login.getName();
    }
    catch (Exception ex){
        response.sendRedirect("index.jsp");
    }       
    
    //recuperamos de la sesion el atributo error
    String sesion, class_text_msg = "", title_operation="";
    
    try {
        class_text_msg  = ((String) request.getSession().getAttribute("class-text-msg"));
        title_operation = ((String) request.getSession().getAttribute("title_operation")).trim();

        sesion = ((String) request.getSession().getAttribute("success")).trim();
    }catch (Exception e1){
        try{
            sesion = ((String) request.getSession().getAttribute("warning")).trim();            
        }catch (Exception e2){
            try{
                sesion = ((String) request.getSession().getAttribute("error")).trim();
            }catch (Exception e3){
                sesion = null;
            }            
        }
    }
    
    String mensaje = "";
    if (sesion != null){
        mensaje = sesion;
    }
    
    request.getSession().setAttribute("error", null);
    request.getSession().setAttribute("correct", null);
    request.getSession().setAttribute("warning", null);

    request.getSession().setAttribute("class-text-msg", null);
    request.getSession().setAttribute("title_operation", null);
    
    
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
                <h3><%=title_operation%></h3>
                
                <p class="message <%=class_text_msg%>"><%=mensaje%></p>  
            </div>
        </div>
            
        <%@include file="inc/javascript.jsp" %>

    </body>
</html:html>


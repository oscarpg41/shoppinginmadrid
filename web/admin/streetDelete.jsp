<!DOCTYPE html>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<%@include file="inc/control.jsp" %>  
  
<html:html lang="true">
    <head>
        <%@include file="inc/head.jsp" %>   
    </head>
    <body>
        
    <header>
        <%@include file="inc/header.jsp" %>
    </header>          

    <div class="admin_content">

        <%@include file="inc/menu.jsp" %>

        <div class="admin_work">
            
            <form id="formInformation" action="streetDeleteAction.do" method="post">
                <h3><bean:message key="admin.title.deleteStreet"/></h3>
                
                <div class="formulario">
                        <div class="row">
                            <div class="col4"><bean:message key="admin.area.select.label"/></div>
                            <div class="col8">
                                <select name="idArea" id="idArea" required >    
                                    <option></option>
                                    <%=listadoAreas%>
                                </select>
                            </div>
                        </div>

                                
                        <div class="row">
                            <div class="col4"><bean:message key="admin.street.select.label"/></div>
                            <div class="col8">
                                <select name="idStreet" id="idStreet" required >
                                    <%=listadoStreets%>
                                </select>
                            </div>
                        </div>
                                
                        <div class="row">
                            <div class="col12 center">
                                <html:submit property="submit" styleId="submit" styleClass="boton btn-primary">
                                    <bean:message key='admin.menu.delete'/>
                                </html:submit>                            
                            </div>
                        </div>                  
                </div>
                                
            </form>            

        </div>
    </div>

    <%@include file="inc/javascript.jsp" %>
    <script>
        mostrarSubMenuStreet();
        
        //cambiamos el valor del select de las calles mediante ajax
        $('#idArea').on('change', cambiaInputStreetByAjax);
        $('#submit').on('click', confirmarBorrado);
        
        var message   = "<%=message%>";
        if (message.length>0)
            $('.modal').show();
        $('.modal .close').on('click', cierraModal);
    </script>
    </body>
</html:html>
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
            
                <h3><bean:message key="admin.title.updateShop"/></h3>
                
                    <div class="formulario">
                        <div class="row">
                            <div class="col2"><bean:message key="admin.area.select.label"/></div>
                            <div class="col4">
                                <select name="idArea" id="idArea" required>
                                    <option></option>
                                    <%=listadoAreas%>
                                </select>
                            </div>
                            <div class="col2"><bean:message key="admin.street.select.label"/></div>
                            <div class="col4">
                                <select name="idStreet" id="idStreet" required disabled>
                                </select>
                            </div>
                        </div>
                    </div>                    

                    <div class="formulario">
                        <div class="listado"></div>
                    </div>                    
        </div>
    </div>

    <%@include file="inc/javascript.jsp" %>
    <script>mostrarSubMenuShop();</script>
    <script>
        $(".formulario:odd").css("display", "none");
        
        //cambiamos el valor del select de las calles mediante ajax
        $('#idArea').on('change', cambiaSelectStreetByAjax);
        //recuperamos las tiendas de la calle y cargamos el listado en la pagina
        $('#idStreet').on('change', loadShopsByAjax);
        
        
        var message   = "<%=message%>";
        if (message.length>0)
            $('.modal').show();
        $('.modal .close').on('click', cierraModal);
        
    </script>     
    </body>
</html:html>
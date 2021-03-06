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
            
            <form id="formNewArea" action="areaUpdateAction.do" method="post">
                <h3><bean:message key="admin.title.updateArea"/></h3>
                
                    <div class="formulario">
                        <div class="row">
                            <div class="col4"><bean:message key="admin.area.select.label"/></div>
                            <div class="col8">
                                <select name="idArea" id="idArea" required>
                                    <option></option>
                                    <%=listadoAreas%>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col4"><bean:message key="admin.areaUpdate.label"/></div>
                            <div class="col8"><input type="text" name="name" id="name" class="input_full" required disabled placeholder="<bean:message key="admin.area.name.input.placeholder"/>"></div> 
                        </div>                        

                        <div class="row">
                            <div class="col6">
                                <bean:message key="admin.descripcion.label"/> <bean:message key="admin.spanish.label"/>
                                <textarea name="descriptionEs" id="descriptionEs" disabled class="input_full"></textarea>
                            </div>
                            <div class="col6">
                                <bean:message key="admin.descripcion.label"/> <bean:message key="admin.english.label"/>
                                <textarea name="descriptionEn" id="descriptionEn" disabled class="input_full"></textarea>
                            </div>
                        </div> 

                        <div class="row">
                            <div class="col12 center">
                                <html:submit property="submit" styleClass="boton btn-primary">
                                    <bean:message key='admin.menu.update'/>
                                </html:submit>                            
                            </div>
                        </div>                        
                    </div>
                    
            </form>            

        </div>
    </div>

    <%@include file="inc/javascript.jsp" %>
    <script>mostrarSubMenuArea();</script>
    <script>
        //cambiamos el valor del input del nombre del area mediante ajax
        $('#idArea').on('change', cambiaSelectAreaByAjax);
        
        var message   = "<%=message%>";
        if (message.length>0)
            $('.modal').show();
        $('.modal .close').on('click', cierraModal);    
    </script>     
    </body>
</html:html>
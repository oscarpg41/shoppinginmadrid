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
            
            <form id="formNewArea" action="streetUpdateAction.do" method="post">
                <h3><bean:message key="admin.title.updateStreet"/></h3>
                
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
                            <div class="col4"><bean:message key="admin.street.select.label"/></div>
                            <div class="col8">
                                <select name="idStreet" id="idStreet" required disabled>
                                </select>
                            </div>
                        </div>
                            
                        <div class="row">
                            <div class="col4"><bean:message key="admin.streetUpdate.label"/></div>
                            <div class="col8"><input type="text" name="name" id="name" class="input_full" required disabled placeholder="<bean:message key="admin.street.name.input.placeholder"/>"></div> 
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
    <script>mostrarSubMenuStreet();</script>
    <script>
        
        //cambiamos el valor del select de las calles mediante ajax
        $('#idArea').on('change', cambiaInputStreetByAjax);        

        $('#idStreet').on('change',function(){
            var valor = $("#idStreet option:selected").html();
            $("#name").prop('disabled', false);
            $("#name").val(valor);
        });

        var message   = "<%=message%>";
        if (message.length>0)
            $('.modal').show();
        $('.modal .close').on('click', cierraModal);    
    </script>     
    </body>
</html:html>
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
            
                <html:form styleId="myForm" action="admin/shopNewAction.do" method="post" enctype="multipart/form-data">
                    
                <h3><bean:message key="admin.title.newShop"/></h3>
                
                <div class="formulario">
                    <div class="row">
                        <div class="col2"><bean:message key="admin.shopNew.label"/></div>
                        <div class="col5"><input type="text" name="name" id="name" class="input_full" required placeholder="<bean:message key="admin.shop.name.input.placeholder"/>"></div> 
                        <div class="col2"><bean:message key="admin.typeShop.select.label"/></div>
                        <div class="col3">
                            <select name="idType" id="idType" required >
                                <option></option>
                                <%=listadoTypeShops%>
                            </select>
                        </div>
                   </div>
                    
                    <div class="row">
                        <div class="col2"><bean:message key="admin.area.select.label"/></div>
                        <div class="col3">
                            <select name="idArea" id="idArea" required>
                                <option></option>
                                <%=listadoAreas%>
                            </select>
                        </div>
                        <div class="col2"><bean:message key="admin.street.select.label"/></div>
                        <div class="col3">
                            <select name="idStreet" id="idStreet" required disabled></select>
                        </div>
                        <div class="col1"><bean:message key="admin.numero.label"/></div>
                        <div class="col1">
                            <input type="text" name="number" id="number" class="input_full">
                        </div>
                    </div>
                            
                    
                    <div class="row">
                        <div class="col2"><bean:message key="admin.zip.label"/></div>
                        <div class="col2">
                            <input type="text" name="zip" id="zip" class="input_small">
                        </div>
                        <div class="col3"><bean:message key="admin.metro.label"/></div>
                        <div class="col5">
                            <input type="text" name="metro" id="metro" required class="input_full">
                        </div>
                    </div>                         

                    <div class="row">
                        <div class="col2"><bean:message key="admin.web.label"/></div>
                        <div class="col10">
                            <input type="url" name="web" id="web" class="input_full" placeholder="<bean:message key="admin.web.input.placeholder"/>">
                            
                        </div>
                    </div>                         


                            
                    <div class="row">
                        <div class="col3"><bean:message key="admin.imagen.select.label"/></div>
                        <div class="col9">
                            <html:file property="theFile"/>
                        </div>    
                    </div>                         
                            
                        
                    <div class="row">
                        <div class="col12 center">
                            <html:submit property="submit" styleId="submit" styleClass="boton btn-primary">
                                <bean:message key='admin.menu.new'/>
                            </html:submit>                            
                        </div>
                    </div>                  
                </div>
                </html:form>       

        </div>
    </div>

    <%@include file="inc/javascript.jsp" %>
    <script>

        mostrarSubMenuShop();
        
        //definimos la longitud de los input
        $("#zip").attr("maxlength", 6);
        $("#number").attr("maxlength", 3);
        
        //cambiamos el valor del select de las calles mediante ajax
        $('#idArea').on('change', cambiaSelectStreetByAjax);

        var message   = "<%=message%>";
        if (message.length>0)
            $('.modal').show();
        $('.modal .close').on('click', cierraModal);    
    </script>     
    </body>
</html:html>
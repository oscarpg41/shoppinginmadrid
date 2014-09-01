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
            
            <html:form styleId="myForm" action="admin/marketUpdateAction.do" method="post" enctype="multipart/form-data">                                
                <h3><bean:message key="admin.title.updateMarket"/></h3>
                
                <div class="formulario">
                    <div class="row">
                        <div class="col3"><bean:message key="admin.market.select.label"/></div>
                        <div class="col9">
                            <select name="idMarket" id="idMarket" required >
                                <option></option>
                                <%=listadoMarkets%>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col2"><bean:message key="admin.marketNew.label"/></div>
                        <div class="col10"><input type="text" name="name" id="name" class="input_full" disabled required placeholder="<bean:message key="admin.market.name.input.placeholder"/>" ></div> 
                    </div>

                   <div class="row">
                        <div class="col2"><bean:message key="admin.street.select.label"/></div>
                        <div class="col4">
                            <input type="text" name="street" id="street" disabled required class="input_full">
                        </div>
                        <div class="col1"><bean:message key="admin.numero.label"/></div>
                        <div class="col1">
                            <input type="text" name="number" id="number" disabled class="input_tiny">
                        </div>
                        <div class="col2"><bean:message key="admin.zip.label"/></div>
                        <div class="col2">
                            <input type="text" name="zip" id="zip" disabled class="input_full">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col2"><bean:message key="admin.metro.label"/></div>
                        <div class="col10">
                            <input type="text" name="metro" id="metro" required disabled class="input_full">
                        </div>
                    </div>                         

                    <div class="row">
                        <div class="col2"><bean:message key="admin.web.label"/></div>
                        <div class="col10">
                            <input type="url" name="web" id="web" class="input_full" disabled placeholder="<bean:message key="admin.web.input.placeholder"/>">
                        </div>
                    </div>                         

                    <div class="row">
                        <div class="col2"><bean:message key="admin.map.label"/></div>
                        <div class="col10">
                            <input type="url" name="maps" id="maps" class="input_full">
                        </div>
                    </div>
                        
                    <div class="row">
                        <div class="col6">
                            <bean:message key="admin.descripcion.label"/> <bean:message key="admin.spanish.label"/>
                            <textarea name="descriptionEs" id="descriptionEs" disabled class="input_full" rows="8"></textarea>
                        </div>
                        <div class="col6">
                            <bean:message key="admin.descripcion.label"/> <bean:message key="admin.english.label"/>
                            <textarea name="descriptionEn" id="descriptionEn" disabled class="input_full" rows="8"></textarea>
                        </div>
                    </div>                                                         

                    <div class="row">
                        <div class="col1"><bean:message key="admin.imagen.label"/></div>
                        <div class="col4 imagen">&nbsp;</div>
                        <div class="col3"><bean:message key="admin.imagen.select.label"/></div>
                        <div class="col4">
                            <html:file property="theFile"/>
                        </div>    
                    </div>                            
                                
                    <div class="row">
                        <div class="col12 center">
                            <html:submit property="submit" styleId="submit" styleClass="boton btn-primary">
                                <bean:message key='admin.menu.update'/>
                            </html:submit>                            
                        </div>
                    </div>                  
                </div>
            </html:form>            

        </div>
    </div>

    <%@include file="inc/javascript.jsp" %>
    <script>
        mostrarSubMenuMarket();
        
        //cambiamos el valor del select de las calles mediante ajax
        $('#idMarket').on('change', cambiaMarketByAjax);        

        var message   = "<%=message%>";
        if (message.length>0)
            $('.modal').show();
        $('.modal .close').on('click', cierraModal);
    </script>
    </body>
</html:html>
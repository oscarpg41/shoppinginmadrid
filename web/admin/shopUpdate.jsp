<!DOCTYPE html>
<%@page import="com.java.shopping.madrid.utils.Constants"%>
<%@page import="com.java.shopping.madrid.models.Shops"%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<%@include file="inc/control.jsp" %>  

<%
    Shops infoShop = new Shops();   
    try{
        //informacion de la tienda
        infoShop = (Shops)request.getSession().getAttribute(Constants.infoShop);
    }
    catch (Exception ex){
        response.sendRedirect("index.jsp");        
    }    
%>    
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
            
                <html:form styleId="myForm" action="admin/shopUpdateAction.do" method="post" enctype="multipart/form-data">
                    
                <h3><bean:message key="admin.title.updateShop"/></h3>
                
                <div class="formulario">
                    <div class="row">
                        <div class="col2"><bean:message key="admin.shopUpdate.label"/></div>
                        <div class="col5"><input type="text" name="name" id="name" class="input_full" required value="<%=infoShop.getName()%>" ></div> 
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
                            <input type="text" name="number" id="number" class="input_full" value="<%=infoShop.getNumber()%>" >
                        </div>
                    </div>
                            
                    
                    <div class="row">
                        <div class="col2"><bean:message key="admin.zip.label"/></div>
                        <div class="col2">
                            <input type="text" name="zip" id="zip" class="input_small" value="<%=infoShop.getZip()%>">
                        </div>
                        <div class="col3"><bean:message key="admin.metro.label"/></div>
                        <div class="col5">
                            <input type="text" name="metro" id="metro" required class="input_full" value="<%=infoShop.getMetro()%>">
                        </div>
                    </div>                         

                    <div class="row">
                        <div class="col2"><bean:message key="admin.web.label"/></div>
                        <div class="col10">
                            <input type="url" name="web" id="web" class="input_full" value="<%=infoShop.getWeb()%>" >
                            
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
                        <div class="col6 center">
                            <html:submit property="submit" styleId="submit" styleClass="boton btn-primary">
                                <bean:message key='admin.menu.update'/>
                            </html:submit>                            
                        </div>
                        <div class="col6 center">
                            <input type="hidden" name="idShop" id="idShop" value="<%=infoShop.getIdShop()%>">
                            <html:button property="delete" styleId="delete" styleClass="boton btn-secundary">
                                <bean:message key='admin.menu.delete'/>
                            </html:button>                            
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
        
        //cargamos la categoria de la tienda
        $("#idType option[value=<%=infoShop.getIdType()%>]").attr("selected",true);  
        
        //cargamos el area
        $("#idArea option[value=<%=infoShop.getIdArea()%>]").attr("selected",true);
        cambiaSelectStreetByAjax();

        //cargamos las calles
        $("#idStreet option[value=<%=infoShop.getIdStreet()%>]").attr("selected",true);
        
        imagenActual = '<img id="image" src="../images/shops/'+ <%=infoShop.getIdShop()%> +'.jpg" width="300px" />';
        $(".imagen").html(imagenActual);
        
        
        //cambiamos el valor del select de las calles mediante ajax
        //cuando cambiamos el area
        $('#idArea').on('change', cambiaSelectStreetByAjax);
        
        
        $('#delete').on('click', sendShopToDelete);
 
    </script>     
    </body>
</html:html>
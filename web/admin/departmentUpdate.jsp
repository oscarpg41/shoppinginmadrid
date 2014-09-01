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
            
            <form id="formUpdateDepartment" action="departmentUpdateAction.do" method="post">
                <h3><bean:message key="admin.title.updateDepartment"/></h3>
                
                    <div class="formulario">
                        <div class="row">
                            <div class="col5"><bean:message key="admin.department.select.label"/></div>
                            <div class="col7">
                                <select name="idDepartmentStore" id="idDepartmentStore" required >
                                    <option></option>
                                    <%=listadoDepartments%>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col5"><bean:message key="admin.departmentUpdate.label"/></div>
                            <div class="col7"><input type="text" name="name" id="name" class="input_full" disabled required ></div> 
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
    <script>mostrarSubMenuDepartment();</script>
    <script>      
        $('#idDepartmentStore').on('change',function(){
            var valor = $("#idDepartmentStore option:selected").html();
            $("#name").val(valor);
            $("#name").prop('disabled', false);
        });
        
        var message   = "<%=message%>";
        if (message.length>0)
            $('.modal').show();
        $('.modal .close').on('click', cierraModal);           
    </script>
    </body>
</html:html>
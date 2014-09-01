<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><bean:message key="name.web"/></title>
        <link href="admin/css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            
            <div class="form-signin">
                <h2><bean:message key="name.web"/></h2>
                <html:form styleId="myForm" action="admin/login.do" method="post">
                    <h4><bean:message key="admin.title"/></h4>
                    <ul>
                        <li>
                            <input type="text" class="input_full" name="user" required autofocus placeholder="<bean:message key="admin.input.putUser"/>">
                        </li>

                        <li>
                            <input type="password" class="input_full" name="password" required placeholder="<bean:message key="admin.input.putKey"/>">
                        </li>

                        <li>
                            <html:submit property="submit" styleClass="boton btn-primary">
                                <bean:message key='admin.input.Enter'/>
                            </html:submit>
                        </li>
                    </ul>
                </html:form>
            </div>
        </div>
    </body>
</html>

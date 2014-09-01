<!doctype html>
<%@include file="inc/main.jsp" %>
<html lang="en">
<head>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Shopping in Madrid</title>
<link rel="stylesheet" href="style.css">
<script src="js/base.js"></script>
</head>
<body>

    <div class="cookies">
        <%@include file="inc/cookies.jsp" %>
    </div>    

    <header>
        <%
            /*
             * Recuperamos el mensaje resultante de la operación sendMail.do
            */
            String message = (String)request.getSession().getAttribute("message");
            if (message == null){ message=""; }
            String class_text_msg  = ((String) request.getSession().getAttribute("class-text-msg"));

            request.getSession().setAttribute("class-text-msg", null);
            request.getSession().setAttribute("message", null);
        %>
        
        <div class="modal"> 
            <div class="info_modal <%=class_text_msg%>">        
                <button class="close">x</button>
                    <%=message%>
            </div>
        </div> 
            
        <%@include file="inc/header.jsp" %>
    </header>

    <nav>
        <%@include file="inc/menu.jsp" %>
    </nav>

    <div class="wrapper">

        <h2><bean:message key="contact.title"/></h2>
            
		
	<div class="texto_contacto"><bean:message key="contact.text" /></div>
        
        <form id="formNewArea" action="sendMail.do" method="post">
            <div class="form_contacto">
              <ul>
                <li><label for="name"><bean:message key='contact.form.name'/>:</label><input type="text" id="name" name="name" required placeholder="<bean:message key="contact.form.name.placeholder"/>"></li>

                <li><label for="email"><bean:message key='contact.form.email'/>:</label><input type="email" id="email" name="email" required placeholder="<bean:message key="contact.form.email.placeholder"/>"></li>

                <li><label for="asunto"><bean:message key='contact.form.subject'/>:</label><input type="text" id="subject" name="subject" required placeholder="<bean:message key="contact.form.subject.placeholder"/>"></li>

                <li><label for="message"><bean:message key='contact.form.text'/>:</label><textarea id="text" name="text" rows="6" required placeholder="<bean:message key="contact.form.text.placeholder"/>"></textarea></li>	

                <li class="submit">
                    <html:submit property="submit" styleClass="boton btn-primary">
                        <bean:message key='contact.send.mail'/>
                    </html:submit> 
                </li>
              </ul>
            </div>
        </form>

    </div> <!-- /wrapper -->  

	

    <div class="footer">
         <%@include file="inc/footer.jsp" %>
    </div>

    <!--   J A V A S C R I P T   -->
    <%@include file="inc/javascript.jsp" %>

    <script src="js/libs/jquery.masonry.min.js"></script>
    
    <script>
        var message   = "<%=message%>";
        if (message.length>0)
            $('.modal').show();
        $('.modal .close').on('click', cierraModal);  
    </script>    
    
</body>
</html>
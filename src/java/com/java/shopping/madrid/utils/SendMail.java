/*
 * Clase que envia un email usando una cuenta de gmail
 *
 * @author
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.utils;

import com.java.shopping.madrid.models.Contact;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.Resources;


public class SendMail extends org.apache.struts.action.Action {
    
    private static Logger log = Logger.getLogger(SendMail.class);
    static Properties props;
            
    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response){
        
        log.debug("BEGIN" );
        
        try
        {
            //obtenemos el objeto tipo Contact con los datos del formulario
            Contact contactForm = (Contact)form;
            
            String name    = new String(contactForm.getName().getBytes("ISO-8859-1"),"UTF-8");
            String subject = new String(contactForm.getSubject().getBytes("ISO-8859-1"),"UTF-8");
            String text    = new String(contactForm.getText().getBytes("ISO-8859-1"),"UTF-8");
            String email   = new String(contactForm.getEmail().getBytes("ISO-8859-1"),"UTF-8");
            
            String msj = "Nombre: "+ name + "\nEmail: "+ email + "\nAsunto: "+ subject + "\nTexto: "+ text;

            log.debug("Nombre:"+ name);
            log.debug("Email:"+ email); 
            log.debug("Subject:"+ subject); 
            log.debug("Text:"+ text);
            log.debug("Msj:"+ msj);

            // Propiedades de la conexión
            props = new Properties();
            props.setProperty("mail.smtp.host", Constants.MAIL_SMTP_HOST);
            props.setProperty("mail.smtp.port", Constants.MAIL_SMTP_PORT);
            props.setProperty("mail.smtp.user", Constants.MAIL_SMTP_USER);
            props.setProperty("mail.smtp.clave", Constants.MAIL_SMTP_PASS);
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.auth", "true");

            
            // Preparamos la sesion
            Session sesion = crearSesion();
            //sesion.setDebug(true);
            log.debug("Sesion creada");
            
            // Construimos el mensaje
            MimeMessage message = new MimeMessage(sesion);
            // Quien envia el correo
            message.setFrom(new InternetAddress(props.getProperty("mail.smtp.user")));
            // A quien va dirigido
            message.setRecipient(Message.RecipientType.TO, 
                    new InternetAddress(Constants.MAIL_ACCOUNT_TO_SEND));
            message.setSubject(Constants.MAIL_SUBJECT);
            message.setText(msj);
            log.debug("Mensaje construido");

            
            // Lo enviamos.
            Transport t = sesion.getTransport("smtp");
            t.connect(props.getProperty("mail.smtp.user"), props.getProperty("mail.smtp.clave"));
            t.sendMessage(message, message.getAllRecipients());
            
            // Cierre.
            t.close();

            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "sendEmail.correct"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-success");
        }
        catch (Exception e)
        {
            log.error("Exception:"+ e.getMessage() );
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "sendEmail.error"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");            
        }
         

        log.debug("END" );
        return mapping.findForward(Constants.SUCCESS); 
    }
    
    
    private static Session crearSesion() {
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(props.getProperty("mail.smtp.user"), props.getProperty("mail.smtp.clave"));
                }
          });
        return session;
    }     
}
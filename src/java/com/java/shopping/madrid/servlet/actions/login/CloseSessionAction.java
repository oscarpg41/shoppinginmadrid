/*
 * Clase que cierra la sesion.
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.java.shopping.madrid.models.Login;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class CloseSessionAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(CloseSessionAction.class);
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        try{
            //recuperamos el userLogin de la sesion.
            Login login     = (Login)request.getSession().getAttribute("userLogin");
            String userName = login.getName();        

            request.getSession().setAttribute("userLogin", null);
            request.getSession().setAttribute("auth", false);
            request.getSession().invalidate();

            log.info("Usuario["+ userName +"] SESION CERRADA");
        }
        catch (Exception ex){}
        
        //redirigimos a la página de inicio
        response.sendRedirect("index.jsp");
        return null;
    }
}


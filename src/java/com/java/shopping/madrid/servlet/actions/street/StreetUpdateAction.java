/*
 * Clase que actualiza un área en la base de datos.
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.street;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Streets;
import com.java.shopping.madrid.utils.Constants;
import com.java.shopping.madrid.utils.Utilities;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.Resources;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class StreetUpdateAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(StreetDeleteAction.class);
    
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    
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
            HttpServletRequest request, HttpServletResponse response) {

        //Instanciamos la clase Utilities
        Utilities utils= new Utilities();        
        
        //limpiamos variables de sesion
        utils.clearMessage(request);
        
        try{

            //vamos a recuperar el usuario y comprobar si es Administrador
            //si es administrador se ejecutará la operación con la base de datos
            if (utils.userIsAdmin(request)){
                //obtenemos el objeto tipo usuarios con los datos del formulario
                Streets streetUpdate = (Streets)form;
                String nombre = new String(streetUpdate.getName().trim().getBytes("ISO-8859-1"),"UTF-8");
                streetUpdate.setName(nombre);

                log.debug("Nombre del area:"+ streetUpdate.getName()); 
                log.debug(" Id de la calle:"+ streetUpdate.getIdStreet()); 

                //Conexion con hibernate y base de datos
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction(); 
                s.update(streetUpdate); 

                tx.commit();
                s.close();

                log.debug("["+ streetUpdate.getName() +"] guardado correctamente en Base de datos");

               //borrarmos de la sesion el listado de las calles
                request.getSession().setAttribute(Constants.selectStreets, null);
            }
            
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.updateStreet.correct"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-success");

        }catch (Exception ex){
            log.error("Exception:"+ ex.getMessage());
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.updateStreet.error"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");
        }
        finally{
            return mapping.findForward(Constants.SUCCESS);
        }

    }
}

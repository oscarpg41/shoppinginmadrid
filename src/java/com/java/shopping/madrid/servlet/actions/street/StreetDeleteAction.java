/*
 * Clase que borra una calle de la base de datos.
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


public class StreetDeleteAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(StreetDeleteAction.class);
    
    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        //Instanciamos la clase Utilities
        Utilities utils= new Utilities();        
        
        //limpiamos variables de sesion
        utils.clearMessage(request);
        

        try{
            //vamos a recuperar el usuario y comprobar si es Administrador
            //si es administrador se ejecutará la operación con la base de datos
            if (utils.userIsAdmin(request)){
                
                //obtenemos el objeto tipo street con los datos del formulario
                Streets streetDeleteForm = (Streets)form;

                log.debug("Id de la calle a borrar: ["+ streetDeleteForm.getIdStreet()+"]"); 

                //Conexion con hibernate y base de datos
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction(); 

                //cargamos la calle que queremos borrar
                Streets streetDelete = new Streets();
                s.load(streetDelete, streetDeleteForm.getIdStreet()); 

                //Borramos la calle
                s.delete(streetDelete); 

                tx.commit();
                s.close();

                //borramos de la sesion el listado de las calles guardadas en base de datos
                request.getSession().setAttribute(Constants.selectStreets, null); 
                
            }
            
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.deleteStreet.correct"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-success");            

        }catch (Exception ex){
            log.error("Exception:"+ ex.getMessage());
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.deleteStreet.error"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");            
        }
        finally{
            return mapping.findForward(Constants.SUCCESS);
        }        

    }
}
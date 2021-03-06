/*
 * Clase que registra un área nueva en la bas de datos.
 * Recupera del formulario el nombre del área y comprueba en base de datos si existe.
 * Si no existe, la guarda en base de datos
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
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author usuario
 */
public class StreetNewAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(StreetNewAction.class);
    
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String ERROR   = "error";

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
            HttpServletRequest request, HttpServletResponse response) {

        //Instanciamos la clase Utilities
        Utilities utils= new Utilities();
        
        //limpiamos variables de sesion
        utils.clearMessage(request);
                
        String nextPage = SUCCESS;
        
        try{
            
            //vamos a recuperar el usuario y comprobar si es Administrador
            //si es administrador se ejecutará la operación con la base de datos
            if (utils.userIsAdmin(request)){
            
                //obtenemos el objeto tipo Street con los datos del formulario
                Streets streetNew = (Streets)form;

                String nombre = new String(streetNew.getName().getBytes("ISO-8859-1"),"UTF-8");
                streetNew.setName(nombre);
                //Guardamoe el nombre con esta codificación para almacenar los acentos y la ñ

                log.debug("Nombre de la calle :"+ streetNew.getName()); 
                log.debug("              Area :"+ streetNew.getIdArea()); 

                //Conexion con hibernate y base de datos
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction(); 

                //comprobamos si la calle ya existe
                Query q = s.getNamedQuery("findStreet");
                q.setParameter("name", nombre);
                Streets result = (Streets)q.uniqueResult();

                if (result == null){
                    //Damos de alta la calle
                    s.save(streetNew); 

                    log.debug("["+ streetNew.getName() +"] guardado correctamente en Base de datos");

                    //mensaje para mostrar al usuario en el jsp
                    request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newStreet.correct"));
                    request.getSession().setAttribute(Constants.class_text_msg, "message-success");
                     

                    //borramos de la sesion el listado de las calles guardadas en base de datos
                    request.getSession().setAttribute("selectStreets", null);             

                }else{
                    log.debug("["+ streetNew.getName() +"] ya esta guardado en nuestra base de datos");

                    //mensaje para mostrar al usuario en el jsp 
                    request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newStreet.warning"));
                    request.getSession().setAttribute(Constants.class_text_msg, "message-warning");
                }

                tx.commit();
                s.close();
            }
            //user is NOT admin
            else{
                //mensaje para mostrar al usuario en el jsp simulando que todo ha ido correctamente
                request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newStreet.correct"));
                request.getSession().setAttribute(Constants.class_text_msg, "message-success");                
            }

        }catch (Exception ex){
            log.error("Exception:"+ ex.getMessage());
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newStreet.error"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");                
        }
        finally{
            return mapping.findForward(nextPage);            
        }
    }
}

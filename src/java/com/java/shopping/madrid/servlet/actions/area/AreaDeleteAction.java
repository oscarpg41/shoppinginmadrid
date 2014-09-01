/*
 * Clase que borra un área de la base de datos.
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.area;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Areas;
import com.java.shopping.madrid.utils.Utilities;
import com.java.shopping.madrid.utils.Constants;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.Resources;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AreaDeleteAction extends org.apache.struts.action.Action {
    
    private static Logger log = Logger.getLogger(AreaDeleteAction.class);

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
                
                //obtenemos el objeto tipo area con los datos del formulario
                Areas areaDeleteForm = (Areas)form;
                log.debug("Id del area a borrar: ["+ areaDeleteForm.getIdArea() +"]");
                
                //Conexion con hibernate y base de datos
                //SessionFactory sf = HibernateUtil.getSessionFactory();
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction(); 

                //cargamos el area que queremos borrar
                Areas areaDelete = new Areas();
                s.load(areaDelete, areaDeleteForm.getIdArea()); 

                //Borramos el area
                s.delete(areaDelete); 

                tx.commit();
                s.close();

                log.debug("Id del area a borrar: ["+
                        areaDelete.getIdArea()+"]["+ areaDelete.getName() +"]"); 

                //guardamos en sesion el nuevo listado de las areas
                request.getSession().setAttribute(Constants.selectAreas, null);   
                List<Areas> listAreas = utils.getAreas();
                String selectAreas = utils.buildSelectAreas(listAreas);
                request.getSession().setAttribute(Constants.selectAreas, selectAreas);                  
            }
            
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.deleteArea.correct"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-success");            


        }catch (Exception ex){
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.deleteArea.error"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");
            log.error("Exception:"+ ex.getMessage());
        }
        finally{
            return mapping.findForward(Constants.SUCCESS);            
        }        
        
    }
}

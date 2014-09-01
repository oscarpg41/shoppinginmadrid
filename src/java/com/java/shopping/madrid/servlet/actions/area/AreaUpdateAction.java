/*
 * Clase que actualiza un área en la base de datos.
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.area;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Areas;
import com.java.shopping.madrid.utils.Constants;
import com.java.shopping.madrid.utils.Utilities;
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

public class AreaUpdateAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(AreaUpdateAction.class);
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
                Areas areaUpdate = (Areas)form;
                String nombre = new String(areaUpdate.getName().trim().getBytes("ISO-8859-1"),"UTF-8");
                areaUpdate.setName(nombre);

                log.debug("Nombre del area:"+ areaUpdate.getName()); 
                log.debug("Id del area:"+ areaUpdate.getIdArea()); 
                
                //codificamos las descripciones para que se guarden correctamente en base de datos (con acentos..)
                //para ello, comprobamos primero si vienen vacios
                String desc_es = "";
                if (areaUpdate.getDescriptionEs() != null){
                    desc_es = new String(areaUpdate.getDescriptionEs().getBytes("ISO-8859-1"),"UTF-8");
                }
                String desc_en = "";
                if (areaUpdate.getDescriptionEs() != null){
                    desc_en = new String(areaUpdate.getDescriptionEn().getBytes("ISO-8859-1"),"UTF-8");
                }
                areaUpdate.setDescriptionEs(desc_es);
                areaUpdate.setDescriptionEn(desc_en); 
                
                
                //Conexion con hibernate y base de datos
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction(); 
                
                s.update(areaUpdate); 

                tx.commit();
                s.close();

                log.debug("["+ areaUpdate.getName() +"] guardado correctamente en Base de datos");

                //guardamos en sesion el nuevo listado de las areas
                request.getSession().setAttribute(Constants.selectAreas, null);   

                List<Areas> listAreas = utils.getAreas();
                String selectAreas = utils.buildSelectAreas(listAreas);
                request.getSession().setAttribute(Constants.selectAreas, selectAreas);
            }            

            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.updateArea.correct"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-success");
            

        }catch (Exception ex){            
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.updateArea.error"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");
            log.error("Exception:"+ ex.getMessage());
        }
        finally{
            return mapping.findForward(Constants.SUCCESS);
        }

    }
}
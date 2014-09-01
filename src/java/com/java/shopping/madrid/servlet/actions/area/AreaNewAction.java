/*
 * Clase que registra un área nueva en la base de datos.
 * Recupera del formulario el nombre del área y comprueba en base de datos si existe.
 * Si no existe, la guarda en base de datos
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

public class AreaNewAction extends org.apache.struts.action.Action {
    
     private static Logger log = Logger.getLogger(AreaNewAction.class);

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

                //obtenemos el objeto tipo area con los datos del formulario
                Areas areaNew = (Areas)form;
                String nombre = new String(areaNew.getName().getBytes("ISO-8859-1"),"UTF-8");
                areaNew.setName(nombre);

                log.debug("Nombre del area:"+ areaNew.getName()); 

                //codificamos las descripciones para que se guarden correctamente en base de datos (con acentos..)
                //para ello, comprobamos primero si vienen vacios
                String desc_es = "";
                if (areaNew.getDescriptionEs() != null){
                    desc_es = new String(areaNew.getDescriptionEs().getBytes("ISO-8859-1"),"UTF-8");
                }
                String desc_en = "";
                if (areaNew.getDescriptionEs() != null){
                    desc_en = new String(areaNew.getDescriptionEn().getBytes("ISO-8859-1"),"UTF-8");
                }
                areaNew.setDescriptionEs(desc_es);
                areaNew.setDescriptionEn(desc_en);                
                
                
                //Conexion con hibernate y base de datos
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction(); 

                //comprobamos si el area ya existe
                //usamos una query definida en Areas.hbm.xml
                Query q = s.getNamedQuery("findArea");
                q.setParameter("name", nombre);
                //usamos .uniqueResult(), aunque tambien podriamos usar .list()
                Areas result = (Areas)q.uniqueResult();
                
                if (result == null){
                    //Damos de alta el area
                    s.save(areaNew); 

                    log.debug("["+ areaNew.getName() +"] guardado correctamente en Base de datos");

                    //mensaje para mostrar al usuario en el jsp
                    request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newArea.correct"));
                    request.getSession().setAttribute(Constants.class_text_msg, "message-success");
                     
                    //borramos de la sesion el listado de las areas guardadas en base de datos
                    request.getSession().setAttribute(Constants.selectAreas, null);             

                }else{
                    log.debug("["+ areaNew.getName() +"] ya esta guardado en nuestra base de datos");

                    //mensaje para mostrar al usuario en el jsp
                    request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newArea.warning"));
                    request.getSession().setAttribute(Constants.class_text_msg, "message-warning");
                }

                tx.commit();
                s.close();
            }
            //user is NOT admin
            else{
                //mensaje para mostrar al usuario en el jsp simulando que todo ha ido correctamente
                request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newArea.correct"));
                request.getSession().setAttribute(Constants.class_text_msg, "message-success");
           }

        }catch (Exception ex){            
            log.error("Exception" +ex.getMessage());

            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newArea.error"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");
        }
        finally{
            return mapping.findForward(Constants.SUCCESS);
        }

    }
}

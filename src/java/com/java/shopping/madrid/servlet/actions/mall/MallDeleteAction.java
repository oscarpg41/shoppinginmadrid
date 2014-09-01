/*
 * Clase que borra un Centro Comercial de la base de datos.
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.mall;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Mall;
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

public class MallDeleteAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(MallDeleteAction.class);
            
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
                
                //obtenemos el objeto tipo mall con los datos del formulario
                Mall mallDeleteForm = (Mall)form;
                log.debug("Id del Centro Comercial a borrar: ["+ mallDeleteForm.getIdMall()+"]");
                
                //Conexion con hibernate y base de datos
                //SessionFactory sf = HibernateUtil.getSessionFactory();
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction(); 

                //cargamos el mall que queremos borrar
                Mall mallDelete = new Mall();
                s.load(mallDelete, mallDeleteForm.getIdMall()); 

                //Borramos el centro comercial
                s.delete(mallDelete); 

                tx.commit();
                s.close();

                log.debug("Id del centro comercial a borrar: ["+
                        mallDelete.getIdMall()+"]["+ mallDelete.getName() +"]"); 
                
                //Construimos el path donde borrar la imagen
                String filePath = getServlet().getServletContext().getRealPath("/") + Constants.PATH_IMAGES_MALLS;
                log.debug("filePath["+ filePath +"]");                
                utils.deleteFile(mallDelete.getIdMall(), filePath);                

                //guardamos en sesion el nuevo listado de los centros comerciales
                request.getSession().setAttribute(Constants.selectMalls, null);   
                List<Mall> listMalls = utils.getMalls();
                String selectMalls = utils.buildSelectMalls(listMalls);
                request.getSession().setAttribute(Constants.selectMalls, selectMalls);                  
            }
            
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.deleteMall.correct"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-success");            


        }catch (Exception ex){
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.deleteMall.error"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");
            log.error("Exception:"+ ex.getMessage());
        }
        finally{
            return mapping.findForward(Constants.SUCCESS);            
        }        
        
    }
}

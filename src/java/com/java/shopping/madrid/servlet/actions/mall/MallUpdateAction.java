/*
 * Clase que actualiza un centro comercial en la base de datos.
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.mall;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Mall;
import com.java.shopping.madrid.utils.Constants;
import com.java.shopping.madrid.utils.Utilities;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import org.apache.struts.validator.Resources;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class MallUpdateAction extends org.apache.struts.action.Action {
    
    private static Logger log = Logger.getLogger(MallUpdateAction.class);
    
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
                
                //obtenemos el objeto Mall con los datos del formulario
                Mall mallUpdate = (Mall)form;

                //recuperamos los nombres y los codificamos para guardarlos correctamente con los acentos
                String nombre  = new String(mallUpdate.getName().getBytes("ISO-8859-1"),"UTF-8");
                String metro   = new String(mallUpdate.getMetro().getBytes("ISO-8859-1"),"UTF-8");
                mallUpdate.setName(nombre);
                mallUpdate.setMetro(metro);
                
                //codificamos las descripciones para que se guarden correctamente en base de datos (con acentos..)
                //para ello, comprobamos primero si vienen vacios
                String desc_es = "";
                if (mallUpdate.getDescriptionEs() != null){
                    desc_es = new String(mallUpdate.getDescriptionEs().getBytes("ISO-8859-1"),"UTF-8");
                }
                String desc_en = "";
                if (mallUpdate.getDescriptionEs() != null){
                    desc_en = new String(mallUpdate.getDescriptionEn().getBytes("ISO-8859-1"),"UTF-8");
                }
                mallUpdate.setDescriptionEs(desc_es);
                mallUpdate.setDescriptionEn(desc_en);                  
                
                
                log.debug("Información del centro comercial["
                        + mallUpdate.getIdMall()+"] ["+ mallUpdate.getName() +"] ["+ mallUpdate.getMetro() +"]"); 


                //Conexion con hibernate y base de datos
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction(); 

                s.update(mallUpdate); 

                tx.commit();
                s.close();

                log.debug("Id:[" + mallUpdate.getIdMall()+"]["+ mallUpdate.getName() +"] guardado correctamente en Base de datos");


                // guardamos en sesion el listado de los centros comerciales guardados en la base de datos
                request.getSession().setAttribute(Constants.selectMalls, null);
                List<Mall> listMalls = utils.getMalls();

                String selectMalls = utils.buildSelectMalls(listMalls);
                log.debug("Listado de centros comerciales["+ selectMalls +"]");

                request.getSession().setAttribute(Constants.selectMalls, selectMalls);
                
                
                //S U B I R   L A   N U E V A   I M A G E N   A L   S E R V I D O R 
                //Construimos el path donde subir la imagen
                String filePath = getServlet().getServletContext().getRealPath("/") + Constants.PATH_IMAGES_MALLS;

                //recuperamos el fichero del formulario
                FormFile myImage = mallUpdate.getTheFile();
                boolean  imgIsUpload = utils.uploadImageToServer(myImage, filePath, mallUpdate.getIdMall());
                if (!imgIsUpload){
                    //mensaje de warning. La imagen no se ha actualizado
                    request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.image.upload.warning"));
                    request.getSession().setAttribute(Constants.class_text_msg, "message-warning");            
                }
                
            }

            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.updateMall.correct"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-success");            

        }catch (Exception ex){
            log.error("Exception:"+ ex.getMessage() );

            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.updateMall.correct"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");            
        }
        finally{
            return mapping.findForward(Constants.SUCCESS);
        }

    }
}
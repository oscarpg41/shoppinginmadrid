/*
 * Clase que actualiza una tienda en la base de datos.
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.shop;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Shops;
import com.java.shopping.madrid.utils.Constants;
import com.java.shopping.madrid.utils.Utilities;
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


public class ShopUpdateAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(ShopUpdateAction.class);
    
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
                
                //obtenemos el objeto Shops con los datos del formulario
                Shops shopUpdate = (Shops)form;

                //recuperamos los nombres y los codificamos para guardarlos correctamente con los acentos
                String nombre  = new String(shopUpdate.getName().getBytes("ISO-8859-1"),"UTF-8");
                String metro   = new String(shopUpdate.getMetro().getBytes("ISO-8859-1"),"UTF-8");
                shopUpdate.setName(nombre);
                shopUpdate.setMetro(metro);
                
                log.debug("Información de la tienda["
                        + shopUpdate.getIdShop()+"] ["+ shopUpdate.getName() +"] ["+ shopUpdate.getMetro() +"]"); 


                //Conexion con hibernate y base de datos
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction(); 

                s.update(shopUpdate); 

                tx.commit();
                s.close();

                log.debug("Id:[" + shopUpdate.getIdShop()+"] ["+ shopUpdate.getName() +"] guardado correctamente en Base de datos");

                //S U B I R   L A   N U E V A   I M A G E N   A L   S E R V I D O R 
                //Construimos el path donde subir la imagen
                String filePath = getServlet().getServletContext().getRealPath("/") + Constants.PATH_IMAGES_SHOPS;

                //recuperamos el fichero del formulario
                FormFile myImage = shopUpdate.getTheFile();
                boolean  imgIsUpload = utils.uploadImageToServer(myImage, filePath, shopUpdate.getIdShop());
                if (!imgIsUpload){
                    //mensaje de warning. La imagen no se ha actualizado
                    request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.image.upload.warning"));
                    request.getSession().setAttribute(Constants.class_text_msg, "message-warning");            
                }
            }

            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.updateShop.correct"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-success");            

        }catch (Exception ex){            
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.updateShop.correct"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");            
        }
        finally{
            return mapping.findForward(Constants.SUCCESS);
        }

    }
}

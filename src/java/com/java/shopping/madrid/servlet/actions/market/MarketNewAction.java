/*
 * Clase que registra una categoria nueva en la base de datos.
 * Recupera del formulario el nombre de al categoria (en español e inglés)
 * y comprueba en base de datos si existe.
 * Si no existe, la guarda en base de datos
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.market;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Markets;
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
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class MarketNewAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(MarketNewAction.class);
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
                
                //obtenemos el objeto Markets con los datos del formulario
                Markets marketNew = (Markets)form;

                //recuperamos los nombres y los codificamos para guardarlos correctamente con los acentos
                String nombre  = new String(marketNew.getName().getBytes("ISO-8859-1"),"UTF-8");
                String metro   = new String(marketNew.getMetro().getBytes("ISO-8859-1"),"UTF-8");
                marketNew.setName(nombre);
                marketNew.setMetro(metro);
                
                //codificamos las descripciones para que se guarden correctamente en base de datos (con acentos..)
                //para ello, comprobamos primero si vienen vacios
                String desc_es = "";
                if (marketNew.getDescriptionEs()!= null){
                    desc_es = new String(marketNew.getDescriptionEs().getBytes("ISO-8859-1"),"UTF-8");
                }
                String desc_en = "";
                if (marketNew.getDescriptionEs() != null){
                    desc_en = new String(marketNew.getDescriptionEn().getBytes("ISO-8859-1"),"UTF-8");
                }
                marketNew.setDescriptionEs(desc_es);
                marketNew.setDescriptionEn(desc_en);
                
                
                //Construimos el path donde subir la imagen
                String filePath = getServlet().getServletContext().getRealPath("/") + Constants.PATH_IMAGES_MARKETS;
                log.debug("filePath["+ filePath +"]");


                //Conexion con hibernate y base de datos
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction(); 

                //comprobamos si el centro comercial ya existe
                Query q = s.getNamedQuery("findMarket");
                q.setParameter("name", nombre);
                Markets result = (Markets)q.uniqueResult();

                if (result == null){
                    //Damos de alta el centro comercial y recuperamos el identificado asignado en base de datos
                    //para usarlo como nombre de la imagen
                    Integer idGenerado = ( Integer )s.save( marketNew );
                    
                    log.debug("idGenerado:["+ idGenerado +"] Nombre:["+ marketNew.getName() +"] guardado correctamente en Base de datos");

                    //S U B I R   I M A G E N   A L   S E R V I D O R
                    //recuperamos el fichero del formulario
                    FormFile myImage = marketNew.getTheFile();
                    boolean  imgIsUpload = utils.uploadImageToServer(myImage, filePath, idGenerado);
                    
                    if (imgIsUpload){
                        //mensaje para mostrar al usuario en el jsp
                        request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newMarket.correct"));
                        request.getSession().setAttribute(Constants.class_text_msg, "message-success");
              
                    }else{
                        request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.image.upload.warning"));
                        request.getSession().setAttribute(Constants.class_text_msg, "message-warning");
                    }

                    //borramos de la sesion el listado de los centros comerciales guardadas en base de datos
                    request.getSession().setAttribute(Constants.selectMarkets, null);

                }else{
                    log.debug("["+ marketNew.getName() +"] ya esta guardado en nuestra base de datos");

                    //mensaje para mostrar al usuario en el jsp
                    request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newMarket.warning"));
                    request.getSession().setAttribute(Constants.class_text_msg, "message-warning");            
                }

                tx.commit();
                s.close();
            }
            //user is NOT admin
            else{
                //mensaje para mostrar al usuario en el jsp simulando que todo ha ido correctamente
                request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newMarket.correct"));
                request.getSession().setAttribute(Constants.class_text_msg, "message-success");            
            }            

        }catch (Exception ex){
            
            log.error("Exception:" + ex.getMessage());

            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newMarket.error"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");            
        }
        finally{
            return mapping.findForward(Constants.SUCCESS);
        }
    }
}

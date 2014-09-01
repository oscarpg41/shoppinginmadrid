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

package com.java.shopping.madrid.servlet.actions.typeShop;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.TypeShop;
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

public class TypeShopNewAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(TypeShopNewAction.class);

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
                
                //obtenemos el objeto TypeShop con los datos del formulario
                TypeShop typeShopNew = (TypeShop)form;

                //recuperamos los nombres y los codificamos para guardarlos correctamente con los acentos
                String nombre_es = new String(typeShopNew.getName_es().getBytes("ISO-8859-1"),"UTF-8");
                String nombre_en = new String(typeShopNew.getName_en().getBytes("ISO-8859-1"),"UTF-8");
                typeShopNew.setName_es(nombre_es);
                typeShopNew.setName_en(nombre_en);

                log.debug("Nombre de la categoria(ES):"+ typeShopNew.getName_es()); 
                log.debug("Nombre de la categoria(EN):"+ typeShopNew.getName_en()); 

                //Conexion con hibernate y base de datos
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction(); 

                //comprobamos si la categoria ya existe
                Query q = s.getNamedQuery("findTypeShop");
                q.setParameter("name_es", nombre_es);
                //usamos .uniqueResult(), aunque tambien podriamos usar .list()
                TypeShop result = (TypeShop)q.uniqueResult();

                if (result == null){
                    //Damos de alta la categoria
                    s.save(typeShopNew); 

                    log.debug("["+ typeShopNew.getName_es() +"]["+ typeShopNew.getName_en() +"] "
                            + "guardado correctamente en Base de datos");

                    //mensaje para mostrar al usuario en el jsp
                    request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newTypeShop.correct"));
                    request.getSession().setAttribute(Constants.class_text_msg, "message-success");


                    //borramos de la sesion el listado de las categorias guardadas en base de datos
                    request.getSession().setAttribute(Constants.selectTypeShop, null);             

                }else{
                    log.debug("["+ typeShopNew.getName_es() +"] ya esta guardado en nuestra base de datos");

                    //mensaje para mostrar al usuario en el jsp
                    request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newTypeShop.warning"));
                    request.getSession().setAttribute(Constants.class_text_msg, "message-warning");
                                        
                }

                tx.commit();
                s.close();
            }
            //user is NOT admin
            else{
                //mensaje para mostrar al usuario en el jsp simulando que todo ha ido correctamente
                request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newTypeShop.correct"));
                request.getSession().setAttribute(Constants.class_text_msg, "message-success");               
            }            

        }catch (Exception ex){
            log.error("Exception:" + ex.getMessage());
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newTypeShop.error"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");

        }
        finally{
            return mapping.findForward(Constants.SUCCESS);
        }
    }
}

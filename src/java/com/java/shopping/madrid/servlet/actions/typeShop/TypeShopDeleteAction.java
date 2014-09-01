/*
 * Clase que borra un área de la base de datos.
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
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts.Globals;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.Resources;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class TypeShopDeleteAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(TypeShopDeleteAction.class);
            
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
                
                //obtenemos el objeto tipo typeShop con los datos del formulario
                TypeShop typeShopDeleteForm = (TypeShop)form;

                //Conexion con hibernate y base de datos
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction(); 

                //cargamos la categoria que queremos borrar
                TypeShop typeShopDelete = new TypeShop();
                s.load(typeShopDelete, typeShopDeleteForm.getIdType()); 

                //Borramos la categoria
                s.delete(typeShopDelete); 

                tx.commit();
                s.close();

                log.info("Id de la categoria a borrar: ["+
                        typeShopDeleteForm.getIdType()+"]["+ typeShopDeleteForm.getName_es()+"]"); 

                //guardamos en sesion el nuevo listado de las categorias
                request.getSession().setAttribute(Constants.selectTypeShop, null);   

                String idioma = request.getSession().getAttribute(Globals.LOCALE_KEY).toString();
                List<TypeShop> listTypeShops = utils.getTypeShop(idioma);
                String selectTypeShops = utils.buildSelectTypeShop(listTypeShops, idioma);

                request.getSession().setAttribute(Constants.selectTypeShop, selectTypeShops);
            }

            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.deleteTypeShop.correct"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-success");             

        }catch (Exception ex){
            log.error("ERROR:" +ex.getMessage());
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.deleteTypeShop.error"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");              
        }
        finally{
            return mapping.findForward(Constants.SUCCESS);            
        }        
   
    }
}

/*
 * Clase que borra un mercado de la base de datos.
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.market;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Markets;
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

public class MarketDeleteAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(MarketDeleteAction.class);

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
                
                //obtenemos el objeto tipo Markets con los datos del formulario
                Markets marketDeleteForm = (Markets)form;
                log.debug("Id del mercado a borrar: ["+ marketDeleteForm.getIdMarket()+"]");
                
                //Conexion con hibernate y base de datos
                //SessionFactory sf = HibernateUtil.getSessionFactory();
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction(); 

                //cargamos el market que queremos borrar
                Markets marketDelete = new Markets();
                s.load(marketDelete, marketDeleteForm.getIdMarket()); 

                //Borramos el mercado
                s.delete(marketDelete); 

                tx.commit();
                s.close();

                log.debug("Id del mercado a borrar: ["+
                        marketDelete.getIdMarket()+"]["+ marketDelete.getName() +"]"); 
                
                //Construimos el path donde borrar la imagen
                String filePath = getServlet().getServletContext().getRealPath("/") + Constants.PATH_IMAGES_MARKETS;
                log.debug("filePath["+ filePath +"]");                
                utils.deleteFile(marketDelete.getIdMarket(), filePath);

                //guardamos en sesion el nuevo listado de los mercados
                request.getSession().setAttribute(Constants.selectMarkets, null);   
                List<Markets> listMarkets = utils.getMarkets();
                String selectMarkets = utils.buildSelectMarkets(listMarkets);
                request.getSession().setAttribute(Constants.selectMarkets, selectMarkets);                  
            }
            
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.deleteMarket.correct"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-success");            


        }catch (Exception ex){
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.deleteMarket.error"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");
            log.error("Exception:"+ ex.getMessage());
        }
        finally{
            return mapping.findForward(Constants.SUCCESS);            
        }        
        
    }
}

/*
 * Clase que recupera la información de una tienda
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.shop;


import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Shops;
import com.java.shopping.madrid.utils.Constants;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class ShopGetAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(ShopGetAction.class);
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Integer idShop = -1;
        
        try{

            idShop = Integer.valueOf(request.getParameter("idShop"));
            log.debug("Id tienda:"+ idShop); 

            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction(); 

            //usamos una query definida en Shops.hbm.xml para buscar la tienda usando el id
            Query q = s.getNamedQuery("getShopById");
            q.setParameter("idShop", idShop);
            Shops result = (Shops)q.uniqueResult();

            
            if (result != null){
                // guardamos en sesion la información de la tienda
                request.getSession().setAttribute(Constants.infoShop, result);
                log.debug("Información recuperada de la tienda ["+ idShop +"]:["+ result.getName()+"]"); 
                    
            }else{
                log.debug("Error al recuperar información de la tienda["+ idShop +"]");            
            }

            tx.commit();
            s.close();

        }catch (Exception ex){
            log.error("No se ha recuperado información para el idShop["+ idShop +"]. Exception:" + ex.getMessage());
        }
        finally{
            return mapping.findForward(Constants.SUCCESS);
        }

    }
}
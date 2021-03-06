/*
 * Clase que recupera la información de un centro comerical
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.mall;


import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Mall;
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


public class MallPublicGetAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(MallPublicGetAction.class);

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Integer idMall = -1;
        
        try{

            idMall = Integer.valueOf(request.getParameter("idMall"));
            log.debug("Id tienda:"+ idMall); 

            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction(); 

            //usamos una query definida en Mall.hbm.xml para buscar la tienda usando el id
            Query q = s.getNamedQuery("getMallById");
            q.setParameter("idMall", idMall);
            Mall result = (Mall)q.uniqueResult();

            
            if (result != null){
                // guardamos en sesion la información de la tienda
                request.getSession().setAttribute(Constants.infoMall, result);
                log.debug("Información recuperada del Centro comercial ["+ idMall +"]:["+ result.getName()+"]"); 
                    
            }else{
                log.error("Error al recuperar información del Centro comercial["+ idMall +"]");            
            }

            tx.commit();
            s.close();

        }catch (Exception ex){
            log.error("No se ha recuperado información para el idMall["+ idMall +"]. Exception:" + ex.getMessage());
        }
        finally{
            return mapping.findForward(Constants.SUCCESS);
        }

    }
}
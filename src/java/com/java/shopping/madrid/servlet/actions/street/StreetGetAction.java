/*
 * Clase que recupera el listado de las calles de una determinada área
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.street;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Streets;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class StreetGetAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(StreetGetAction.class);
     
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Integer idArea = -1;
        
        try{
            String returnHTML="";
            //obtenemos el objeto tipo streets con los datos del formulario
            Streets areaNew  = (Streets)form;
            idArea = Integer.valueOf(request.getParameter("idArea"));
            areaNew.setIdArea(idArea);

            log.debug("Id del area:"+ idArea); 

            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction(); 

            Query q = s.getNamedQuery("getStreetsByIdArea");
            q.setParameter("idArea", idArea);
            List<Streets> result = q.list();

            if (result != null){
                    
                for ( Streets str : result ){
                    returnHTML += "<option value='" + str.getIdStreet() +"'>"+ str.getName() +"</option>";
                }
                
                log.debug("returnHTML:"+ returnHTML);
                
                response.setContentType("application/html");
                PrintWriter out = response.getWriter();
                out.println( returnHTML );
                out.flush();
                out.close();

            }else{
                log.error("Error al recuperar las calles del idArea["+ idArea +"]");            
            }

            tx.commit();
            s.close();

        }catch (Exception ex){
            log.error("No se ha recuperado las calles para el idArea["+ idArea +"]. Exception:" + ex.getMessage());
        }
        finally{
            return null;
        }
    }
}

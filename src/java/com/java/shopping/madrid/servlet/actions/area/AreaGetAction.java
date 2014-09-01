/*
 * Clase que recupera la información de un area usando el idArea
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.area;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Areas;
import java.io.PrintWriter;
import org.apache.log4j.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class AreaGetAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static Logger log = Logger.getLogger(AreaGetAction.class);


    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        String nextPage = SUCCESS;
        Integer idArea = -1;
        
        try{
            //obtenemos el objeto tipo usuarios con los datos del formulario
            Areas areaForm  = (Areas)form;
            idArea = Integer.valueOf(request.getParameter("idArea"));
            areaForm.setIdArea(idArea);

            log.debug("Id del area:"+ idArea); 

            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction(); 

            //usamos una query definida en Areas.hbm.xml para buscar el area usando el id
            Query q = s.getNamedQuery("getAreaById");
            q.setParameter("idArea", idArea);
            Areas result = (Areas)q.uniqueResult();

            if (result != null){
                    
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.println("{");
                out.println("\"areaName\": \" "+result.getName()+" \",");
                out.println("\"descriptionEs\": \" "+ result.getDescriptionEs() +" \",");
                out.println("\"descriptionEn\": \" "+ result.getDescriptionEn() +" \"");                
//                  out.println("\"areaName\": \" "+result.getName()+" \",");
                out.println("}");

                out.flush();
                out.close();
                
                log.debug("Nombre del area["+ idArea +"]:"+ result.getName()); 
                log.debug("Descr. del area["+ idArea +"]:"+ result.getDescriptionEs()); 
                
//http://stackoverflow.com/questions/6154845/returning-json-response-from-servlet-to-javascript-jsp-page                    
                    
            }else{
                log.error("Error al recuperar información del idArea["+ idArea +"]");
            }

            tx.commit();
            s.close();

        }catch (Exception ex){
            log.error("No se ha recuperado información para el idArea["+ idArea +"]. Exception:" + ex.getMessage());
        }
        finally{
            return null;
            
        }            

    }
}

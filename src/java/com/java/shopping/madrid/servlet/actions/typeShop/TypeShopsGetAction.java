/*
 * Clase que recupera la información de una categoria usando el idType
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.typeShop;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.TypeShop;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/*
 * para generar el json he seguido las indicaciones de:
 * http://stackoverflow.com/questions/6154845/returning-json-response-from-servlet-to-javascript-jsp-page
 */
public class TypeShopsGetAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(TypeShopNewAction.class);

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
            Integer idType = -1;
        
        try{
            //obtenemos el objeto tipo usuarios con los datos del formulario
            TypeShop typeShopForm  = (TypeShop)form;
            idType = Integer.valueOf(request.getParameter("idType"));
            typeShopForm.setIdType(idType);

            log.debug("Id de la categoria:"+ idType); 

            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction(); 

            //usamos una query definida en TypeShop.hbm.xml para buscar la categoria usando el id
            Query q = s.getNamedQuery("getTypeShopById");
            q.setParameter("idType", idType);
            TypeShop result = (TypeShop)q.uniqueResult();

            if (result != null){
                    
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.println("{");
                out.println("\"typeShopNameEs\": \" "+result.getName_es()+" \",");
                out.println("\"typeShopNameEn\": \" "+result.getName_en()+" \"");
                out.println("}");

                out.flush();
                out.close();
                
                log.debug("Nombre de la categoria["+ idType +"]:["+ result.getName_es()+"]:["+ result.getName_en() +"]"); 

                    
            }else{
                log.error("Error al recuperar información del idType["+ idType +"]");            
            }

            tx.commit();
            s.close();

        }catch (Exception ex){
            log.error("Exception:" + ex.getMessage());
        }
        finally{
            return null;
            
        }            

    }
}

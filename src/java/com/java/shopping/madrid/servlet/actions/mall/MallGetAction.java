/*
 * Clase que recupera la información de un centro comercial
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.mall;


import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Mall;
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


public class MallGetAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(MallGetAction.class);
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Integer idMall = -1;
        
        try{
            //obtenemos el objeto tipo usuarios con los datos del formulario
            Mall mallForm  = (Mall)form;
            idMall = Integer.valueOf(request.getParameter("idMall"));
            mallForm.setIdMall(idMall);

            log.debug("Id centro comercial:"+ idMall); 

            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction(); 

            //usamos una query definida en Mall.hbm.xml para buscar la categoria usando el id
            Query q = s.getNamedQuery("getMallById");
            q.setParameter("idMall", idMall);
            Mall result = (Mall)q.uniqueResult();


            if (result != null){
                
                //Construimos el path donde subir la imagen

                String imageActual = result.getIdMall() + ".jpg";
                log.debug("imageActual ["+ idMall +"]:["+ imageActual +"]");
                    
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.println("{");
                
                out.println("\"name\": \" "  + result.getName() +" \",");
                out.println("\"street\": \" "+ result.getStreet() +" \",");
                out.println("\"number\": \" "+ result.getNumber() +" \",");
                out.println("\"zip\": \" "   + result.getZip() +" \",");
                out.println("\"web\": \" "   + result.getWeb() +" \",");
                out.println("\"maps\": \" "   + result.getMaps()+" \",");                
                out.println("\"metro\": \" " + result.getMetro() +" \",");
                out.println("\"descriptionEs\": \" "+ result.getDescriptionEs() +" \",");
                out.println("\"descriptionEn\": \" "+ result.getDescriptionEn() +" \",");
                out.println("\"imagen\": \" "+  imageActual +" \"");
                
                out.println("}");
                
                log.debug("Descripcion EN"+result.getDescriptionEn());

                out.flush();
                out.close();
                
                log.debug("Información recuperada del centro comercial ["+ idMall +"]:["+ result.getName()+"]"); 

                    
            }else{
                log.debug("Error al recuperar información del centro comercial["+ idMall +"]");            
            }

            tx.commit();
            s.close();

        }catch (Exception ex){
            log.error("No se ha recuperado información para el idMall["+ idMall +"]. Exception:" + ex.getMessage());
        }
        finally{
            return null;
        }            

    }
}

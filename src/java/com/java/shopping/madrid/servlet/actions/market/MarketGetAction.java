/*
 * Clase que recupera la información de un mercado usando la clave primaria
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.market;


import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Markets;
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


public class MarketGetAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(MarketGetAction.class);
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        Integer idMarket = -1;
        
        try{
            //obtenemos el objeto tipo usuarios con los datos del formulario
            Markets marketForm  = (Markets)form;
            idMarket = Integer.valueOf(request.getParameter("idMarket"));
            marketForm.setIdMarket(idMarket);

            log.debug("Id mercado:"+ idMarket); 

            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction(); 

            //usamos una query definida en Markets.hbm.xml para buscar la categoria usando el id
            Query q = s.getNamedQuery("getMarketById");
            q.setParameter("idMarket", idMarket);
            Markets result = (Markets)q.uniqueResult();


            if (result != null){
                
                //Construimos el path donde subir la imagen

                String imageActual = result.getIdMarket()+ ".jpg";
                log.debug("imageActual ["+ idMarket +"]:["+ imageActual +"]");
                    
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

                out.flush();
                out.close();
                
                log.debug("Información recuperada del centro comercial ["+ idMarket +"]:["+ result.getName()+"]"); 

                    
            }else{
                log.error("Error al recuperar información del centro comercial["+ idMarket +"]");            
            }

            tx.commit();
            s.close();

        }catch (Exception ex){
            log.error("No se ha recuperado información para el idMarket["+ idMarket +"]. Exception:" + ex.getMessage());
        }
        finally{
            return null;
            
        }            

    }
}

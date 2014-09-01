/*
 * Clase que recupera el listado de las tiendas de una determinada calle
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.shop;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Shops;
import com.java.shopping.madrid.utils.Constants;
import java.io.PrintWriter;
import java.util.List;
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


public class ShopListAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(ShopListAction.class);

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Integer idStreet = -1;

        try{
            String returnHTML="";
            //obtenemos el objeto tipo streets con los datos del formulario
            Shops shop  = (Shops)form;
            idStreet = Integer.valueOf(request.getParameter("idStreet"));
            shop.setIdStreet(idStreet);

            log.debug("Id de la calle:"+ idStreet);

            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction();

            Query q = s.getNamedQuery("getShopsByIdStreet");
            q.setParameter("idStreet", idStreet);
            List<Shops> result = q.list();


            if (result != null){                
                if (result.isEmpty()){
                    returnHTML +="<div class='row'><div class='col12 center'><h3>"+ Resources.getMessage(request, "admin.list.shops.empty")  +"</h3></div></div>";
                }
                else{
                    returnHTML +="<div class='row'><div class='col12'><h3>"+ Resources.getMessage(request, "admin.list.shops")  +"</h3></div></div>";
                }
                

                int contador = 0;
                for ( Shops shp : result ){
                    //String url = "/shopMadrid/admin/shopGetAction.do?idShop=" + shp.getIdShop();
                    String url = Constants.PrefixAction +"/shopGetAction.do?idShop=" + shp.getIdShop();
                    
                    contador++;
                    if (contador%3 == 1){ returnHTML += "<div class='row'>"; }

                    returnHTML += "<div class='col4'>"+  contador+".&nbsp;<a href='"+ url +"'>" + shp.getName() + "</a></div>";

                    if (contador%3 == 0){ returnHTML += "</div>"; }
                }

                if (contador%3 > 0){ returnHTML += "</div>"; }
                
                log.debug("returnHTML:" + returnHTML);

                response.setContentType("application/html");
                PrintWriter out = response.getWriter();
                out.println( returnHTML );
                out.flush();
                out.close();

            }else{
                log.error("Error al recuperar las tiendas de la calle["+ idStreet +"]");
            }

            
            tx.commit();
            s.close();

        }catch (Exception ex){
            log.error("No se ha recuperado las calles para la calle["+ idStreet +"]. Exception:" + ex.getMessage());
        }
        finally{
            return null;
        }
    }
}
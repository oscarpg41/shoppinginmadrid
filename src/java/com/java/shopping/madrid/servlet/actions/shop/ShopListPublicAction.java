/**
 * Clase que recupera el listado de las tiendas de una determinada calle.
 * Puede usar tambien como condición el tipo de tienda.
 *
 * Para realizar la paginación me he basado en la información de la siguiente página:
 * http://cursohibernate.es/doku.php?id=unidades:05_hibernate_query_language:01_query
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


public class ShopListPublicAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(ShopListPublicAction.class);

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String mensajeListEmpty = "<div class='message message-error'>"+ Resources.getMessage(request, "admin.list.shops.empty")  +"</div>";
        String mensajeError = "<div class='message message-error'>"+ Resources.getMessage(request, "errors.general")  +"</div>";

        String condicional  = " WHERE ";
        String returnHTML   = "";
        Integer idStreet        = -1;
        Integer idType          = -1;
        Integer paginaAMostrar  = 1;


        try{

            //obtenemos el objeto tipo Shops con los datos del formulario
            idStreet = Integer.valueOf(request.getParameter("idStreet"));
            condicional += "idStreet="+idStreet;
            
            //esta comprobación es para el caso que el usuario no haya seleccionado
            //el tipo de tienda (deportes, moda....)
            try{
                idType   = Integer.valueOf(request.getParameter("idType"));
                condicional += " AND idType="+idType;
            }catch (Exception e){
                idType = -1;
            }            
            log.debug("idStreet["+ idStreet + "] idType["+ idType +"]");

            
            //recuperamos el numero de la página que queremos mostrar
            try{
                paginaAMostrar   = Integer.valueOf(request.getParameter("numPage"));
            }catch (Exception e){
                log.debug("Exception paginaAMostrar. Por defecto = 1");
                paginaAMostrar = 1;
            }
            log.debug("paginaAMostrar["+ paginaAMostrar + "]");
            
            
            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction();
            
            //se calcula el número de páginas
            String s_query = "SELECT count(*) FROM Shops" + condicional;
            long numTotalObjetos = (Long) s.createQuery(s_query).uniqueResult();
            int numPaginas =(int) Math.ceil((double)numTotalObjetos / (double)Constants.TAMANYO_PAGINA);
            
            log.debug("query:"+ s_query +" [numTotalObjetos["+ numTotalObjetos +"]numPag["+ numPaginas +"]TAMANYO_PAGINA["+ Constants.TAMANYO_PAGINA +"]");
            

            Query q = s.getNamedQuery("getShopsByStreetPageArea");            
            //si hemos recibido el idType, cargamos otra query
            if (idType>0){
                q = s.getNamedQuery("getShopsByTypePageArea");
                q.setParameter("idType", idType);
            }            
            q.setParameter("idStreet", idStreet);
            
            //Indicamos que sólo se devuelvan como máximo tantos objetos como tamaño tiene la página.
            q.setMaxResults(Constants.TAMANYO_PAGINA);
            //Indicamos cuál es el primer objeto a retornar.
            q.setFirstResult( (paginaAMostrar-1) * Constants.TAMANYO_PAGINA);
            log.debug("q.setFirstResult["+ (paginaAMostrar-1) * Constants.TAMANYO_PAGINA + "]");
            
            //recorremos todos los objetos recuperados de la consulta y vamos creando la respuesta
            List<Shops> result = q.list();
            if (result != null){                
                if (result.isEmpty()){
                    returnHTML += mensajeListEmpty;
                }
                else{
                    
                    
                    //Generamos la respuesta en HTML que se enviara a la pagina
                    returnHTML +="<h3>"+ Resources.getMessage(request, "admin.list.shops")  +"</h3>";
                    returnHTML +="<div class='container'>";
                    for ( Shops shp : result ){
                        //String url = "/shopMadrid/shopGetAction.do?idShop=" + shp.getIdShop(); 
                        String url = Constants.PrefixAction +"/shopGetAction.do?idShop=" + shp.getIdShop(); 

                        String urlImg = "images/shops/"+ shp.getIdShop() +".jpg";

                        returnHTML += "<div class='box'><div class='article'>";
                        returnHTML += "<a href='"+ url +"'><img alt='"+ shp.getName() + "' class='thumbnail' src='"+ urlImg  +"'>";
                        returnHTML += shp.getName() + "</a></div><!-- article -->";
                        returnHTML += "</div><!-- box -->";
                    }
                    returnHTML += "</div> <!-- container -->";
                    //hasta aqui se ha generado la informacion relativa al listado de tiendas.


                    //ahora generamos la información referente a la navegacion de la paginacion
                    int nextPage     = paginaAMostrar +1;
                    int previousPage = paginaAMostrar -1;
                    returnHTML  +="<div class='paginacion'><p>"
                                + Resources.getMessage(request, "label.page") +" " 
                                + paginaAMostrar  +" "+ Resources.getMessage(request, "label.of")  +" " 
                                +  numPaginas +"</p>";
                    if (previousPage >0){
                        returnHTML +="<a href='javascript:goPage("+ previousPage +")'>"+ Resources.getMessage(request, "label.previous") +"</a>";
                    }
                    if (nextPage <= numPaginas){
                        returnHTML +="<a href='javascript:goPage("+ nextPage +")'>"+ Resources.getMessage(request, "label.next") +"</a>";
                    }
               }
                 
                log.debug("returnHTML:" + returnHTML);
                
            }else{
                log.error("Error al recuperar las tiendas de la calle["+ idStreet +"]");
                returnHTML += mensajeError;
            }

            tx.commit();
            s.close();

        }catch (Exception ex){
            log.error("No se ha recuperado las calles para la calle["+ idStreet +"]. Exception:" + ex.getMessage());
            returnHTML += mensajeError;
        }
        finally{
            //cerramos la respuesta
            response.setContentType("application/html");
            PrintWriter out = response.getWriter();
            out.println( returnHTML );
            out.flush();
            out.close();
                
            return null;
        }
    }
}
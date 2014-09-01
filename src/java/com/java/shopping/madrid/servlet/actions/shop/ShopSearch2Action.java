/**
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


public class ShopSearch2Action extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(ShopListPublicAction.class);

    private static final String SQLCOUNT = "SELECT count(*) FROM Shops";
    private static final String WHERE    = " WHERE";
    
    

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String mensajeListEmpty = "<div class='message message-error'>"+ Resources.getMessage(request, "admin.list.shops.empty")  +"</div>";
        String mensajeError = "<div class='message message-error'>"+ Resources.getMessage(request, "errors.general")  +"</div>";

        String condicional  = "";
        String returnHTML   = "";
        String texto        = "";
        int idType          = -1;
        int paginaAMostrar  = 1;

        try{

           //obtenemos el objeto tipo Shops con los datos del formulario
            try{
                texto = request.getParameter("texto").trim();
                if (texto.length()>0){
                    condicional += " name LIKE '%"+ texto +"%'";
                }
            }catch (Exception e){}            

            //esta comprobación es para el caso que el usuario no haya seleccionado
            //el tipo de tienda (deportes, moda....)
            try{
                idType   = Integer.valueOf(request.getParameter("idType"));
                condicional  += " AND idType="+idType;
            }catch (Exception e){}            

            if (condicional.length()>0){
                condicional = WHERE + condicional;
                condicional = condicional.replace("WHERE AND", WHERE);
            }

            
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
          
            //Recuperamos las tiendas que cumplen las condiciones
            s_query = SQLCOUNT + condicional;
            log.debug("s_query["+ s_query + "]");
            Query q = s.createSQLQuery(s_query);
            
            
            //Indicamos que sólo se devuelvan como máximo tantos objetos como tamaño tiene la página.
            q.setMaxResults(Constants.TAMANYO_PAGINA);
            //Indicamos cuál es el primer objeto a retornar.
            q.setFirstResult( (paginaAMostrar-1) * Constants.TAMANYO_PAGINA);
            log.debug("q.setFirstResult["+ (paginaAMostrar-1) * Constants.TAMANYO_PAGINA + "]");
            
            //recorremos todos los objetos recuperados de la consulta y vamos creando la respuesta
            List<Shops> result = (List<Shops>) q.list();
            if (result != null){                
                if (result.isEmpty()){
                    returnHTML += mensajeListEmpty;
                }
                else{
                    //Generamos la respuesta en HTML que se enviara a la pagina
                    returnHTML +="<h3>"+ Resources.getMessage(request, "admin.list.shops")  +"</h3>";
                    returnHTML +="<div class='container'>";

                    for( int i=0; i< result.size(); i++) {
                        System.out.println("Total amount="+result.get(i).getIdArea());
                    }               

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
                log.error("Error al recuperar las tiendas. Condicion:["+ condicional +"]");
                returnHTML += mensajeError;
            }

            tx.commit();
            s.close();

        }catch (Exception ex){
            log.error("Error al recuperar las tiendas. Condicion:["+ condicional +"]. Exception:" + ex.getMessage());
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
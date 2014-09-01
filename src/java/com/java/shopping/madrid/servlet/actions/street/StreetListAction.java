/*
 * Busca en sesion la variable donde se guarda el listado de las áreas.
 * Si no está guardada en sesión, accede a la base de datos para recuperar todas las calle y 
 * lo guarda en sesión.
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.street;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Streets;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class StreetListAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(StreetListAction.class);
    
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        //Vamos a comprobar si esta la lista de calles en sesión
        String selectStreets = (String)request.getSession().getAttribute("selectStreets");
        log.debug("selectStreets::"+selectStreets);
        
        if (selectStreets == null || selectStreets.length() == 0){
            //recuperamos de base de datos el listado de calles
            log.debug("selectStreets:: NO EXISTE");            
            selectStreets = "";
            List<Streets> listStreets = getStreets();
            for (Streets a: listStreets){                
                selectStreets += "<option value="+ a.getIdStreet()+">"+ a.getName() +"</option>";
            }
            log.debug("selectStreets["+ selectStreets +"]");

            // guardamos en sesion el listado de las calles guardados en la base de datos
            request.getSession().setAttribute("selectStreets", selectStreets);
        }

        return mapping.findForward(SUCCESS);
    }        
        
    
    /**
     * método que recupera las calles de un área guardadas en base de datos
     * @return List<Areas> 
     */
    private List<Streets> getStreets() {        
        
        try{
            //Conexion con hibernate y base de datos
            SessionFactory sf = HibernateUtil.getSessionFactory();
            Session s = sf.openSession();

            Transaction tx = s.beginTransaction();

            //recuperamos todas las áreas existentes
            //usamos una query definida en Street.hbm.xml
            Query q = s.getNamedQuery("getStreetsByIdArea");
            List<Streets> result = (List<Streets>)q.list();

            tx.commit();
            s.close();
            return result;
        }
        catch (Exception ex){
            log.error("getStreets(). Exception:" +ex.getMessage());
            return null;
        }
    }
}

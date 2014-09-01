/*
 * Busca en sesion la variable donde se guarda los diferentes listados que usaremos en la zona de administración:
 * listado de areas, de categorias de tiendas, de grandes almacenes....
 * Si no está guardada en sesión, accede a la base de datos para recuperar todas las areas y 
 * lo guarda en sesión
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class GetAllListAction extends org.apache.struts.action.Action {

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
        
        //Instanciamos la clase Utilities
        Utilities utils= new Utilities();
        
        //Vamos a comprobar si estan todas las listas guardadas en sesión
        utils.checkAllList(request);

        return mapping.findForward(Constants.SUCCESS);
    }
}

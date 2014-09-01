/*
 * Clase que actualiza un área en la base de datos.
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.departmentStore;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.DepartmentStore;
import com.java.shopping.madrid.utils.Constants;
import com.java.shopping.madrid.utils.Utilities;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.Resources;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class DepartmentUpdateAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(DepartmentUpdateAction.class);
    
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
            HttpServletRequest request, HttpServletResponse response) {

        //Instanciamos la clase Utilities
        Utilities utils= new Utilities();        
        
        //limpiamos variables de sesion
        utils.clearMessage(request);

        try{
            //vamos a recuperar el usuario y comprobar si es Administrador
            //si es administrador se ejecutará la operación con la base de datos
            if (utils.userIsAdmin(request)){

                //obtenemos el objeto tipo usuarios con los datos del formulario
                DepartmentStore departmentUpdate = (DepartmentStore)form;
                String nombre = new String(departmentUpdate.getName().trim().getBytes("ISO-8859-1"),"UTF-8");
                departmentUpdate.setName(nombre);

                log.debug("Nombre del gran almacen["+ departmentUpdate.getIdDepartmentStore() +"]"+ departmentUpdate.getName()); 

                //Conexion con hibernate y base de datos
                Session s = HibernateUtil.getSessionFactory().openSession();

                Transaction tx = s.beginTransaction(); 
                s.update(departmentUpdate); 

                tx.commit();
                s.close();

                log.debug("["+ departmentUpdate.getName() +"] guardado correctamente en Base de datos");

                //guardamos en sesion el nuevo listado de las areas
                request.getSession().setAttribute(Constants.selectDepartments, null);
                
                List<DepartmentStore> listDepartments = utils.getDepartmentStore();
                String selectDepartments = utils.buildSelectDepartmentStore(listDepartments);
                log.debug("Listado de Grandes almacenes["+ selectDepartments +"]");

                request.getSession().setAttribute(Constants.selectDepartments, selectDepartments);
                
            }
            
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.updateDepartment.correct"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-success");            

        }catch (Exception ex){
            log.error("Exception" +ex.getMessage());

            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.updateDepartment.correct"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");            

        }
        finally{
            return mapping.findForward(Constants.SUCCESS);
        }
    }
}
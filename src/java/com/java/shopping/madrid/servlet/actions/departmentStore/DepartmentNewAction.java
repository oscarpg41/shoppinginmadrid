/*
 * Clase que registra el nombre de un gran almacen en la base de datos.
 * Recupera del formulario el nombre y comprueba en base de datos si existe.
 * Si no existe, la guarda en base de datos.
 * 
 * En la tabla department_store lo que se guarda es el nombre: por ejemplo 'El Corte Inglés'
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.departmentStore;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.DepartmentStore;
import com.java.shopping.madrid.utils.Utilities;
import com.java.shopping.madrid.utils.Constants;
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

public class DepartmentNewAction extends org.apache.struts.action.Action {

    private static Logger log = Logger.getLogger(DepartmentNewAction.class);

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

                //obtenemos el objeto tipo DepartmentStore con los datos del formulario
                DepartmentStore deptStoreNew = (DepartmentStore)form;
                String nombre = new String(deptStoreNew.getName().getBytes("ISO-8859-1"),"UTF-8");
                deptStoreNew.setName(nombre);

                log.debug("Nombre del gran almacen:"+ deptStoreNew.getName()); 

                //Conexion con hibernate y base de datos
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction(); 

                //comprobamos si el gran almacen ya existe
                //usamos una query definida en DepartmentStore.hbm.xml
                Query q = s.getNamedQuery("findDepartment");
                q.setParameter("name", nombre);
                //usamos .uniqueResult(), aunque tambien podriamos usar .list()
                DepartmentStore result = (DepartmentStore)q.uniqueResult();

                if (result == null){
                    //Damos de alta el gran almacen
                    s.save(deptStoreNew); 

                    log.debug("["+ deptStoreNew.getName() +"] guardado correctamente en Base de datos");

                    //mensaje para mostrar al usuario en el jsp
                    request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newDepartment.correct"));
                    request.getSession().setAttribute(Constants.class_text_msg, "message-success");              

                    //borramos de la sesion el listado de los grandes alamcenes guardadas en base de datos
                    request.getSession().setAttribute(Constants.selectDepartments, null);             


                }else{
                    log.debug("["+ deptStoreNew.getName() +"] ya esta guardado en nuestra base de datos");

                    //mensaje para mostrar al usuario en el jsp
                    request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newDepartment.warning"));
                    request.getSession().setAttribute(Constants.class_text_msg, "message-warning");                    
                }

                tx.commit();
                s.close();
            }
            //user is NOT admin
            else{
                //mensaje para mostrar al usuario en el jsp simulando que todo ha ido correctamente
                request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newDepartment.correct"));
                request.getSession().setAttribute(Constants.class_text_msg, "message-success");
            }

        }catch (Exception ex){
            log.error("Exception" +ex.getMessage());
            
            //mensaje para mostrar al usuario en el jsp
            request.getSession().setAttribute(Constants.message, Resources.getMessage(request, "admin.newDepartment.error"));
            request.getSession().setAttribute(Constants.class_text_msg, "message-error");            
        }
        finally{
            return mapping.findForward(Constants.SUCCESS);
        }

    }
}

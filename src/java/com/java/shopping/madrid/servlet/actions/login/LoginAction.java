/*
 * Clase que permite acceder a la zona de administración.
 * Recupera del formulario el usuario y la clave y comprueba en base de datos si existe.
 * Si existe, permite el paso y crea la sesión de administración
 *
 * @author Oskar Pérez
 * @project: ShoppingInMadrid
 * @year: 2014
 */

package com.java.shopping.madrid.servlet.actions.login;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.java.shopping.madrid.models.Login;
import com.java.shopping.madrid.utils.Utilities;
import java.util.Locale;
import org.apache.log4j.Logger;
import org.apache.struts.Globals;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class LoginAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String ERROR   = "error";
    
    private static Logger log = Logger.getLogger(LoginAction.class);
   
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        //Vamos a definir el idioma del navegador por defecto como español
        Locale lCastellano = new Locale("ES","");
        request.getSession().setAttribute(Globals.LOCALE_KEY, lCastellano);
        
        //borramos la información de la sesión
        request.getSession().setAttribute("class-text-msg", null);
        request.getSession().setAttribute("message", null);  

        String nextPage = SUCCESS;

        //obtenemos el objeto tipo login con los datos del formulario
        Login userForm = (Login)form;
        //String nombre = new String(user.getNombre().getBytes("ISO-8859-1"),"UTF-8");

        
        //Vamos a encriptar la password
        Utilities utils= new Utilities();        
        String passMD5= utils.encriptarMD5(userForm.getPassword());
        log.debug("Usuario["+ userForm.getUser() +"] Password["+ passMD5 +"]");


        //Conexion con hibernate y base de datos
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session s = sf.openSession();        
        
        //Creamos la tranición
        Transaction tx = s.beginTransaction(); 
        
        
        //comprobamos si el usuario ya existe
        //usamos una query definida en Usuarios.hbm.xml
        Query q = s.getNamedQuery("loginUsuario");
        q.setParameter("user", userForm.getUser());
        q.setParameter("password", passMD5);
        
        
        //usamos .uniqueResult(), aunque tambien podriamos usar .list()
        Login result = (Login)q.uniqueResult();
        if (result == null){
            //El usuario no está dado de alta en nuestra base de datos
            log.error("El usuario ["+ userForm.getUser()+"] no esta guardado en nuestra base de datos");
            nextPage = ERROR;
        }else{
            //el usuario esta registrado en el panel de administración
            //creamos la sesion y guardamos los datos del Login
            request.getSession().setAttribute("userLogin", result);
            request.getSession().setAttribute("auth", true);
            log.info("Usuario["+ userForm.getUser() +","+ result.getName()+"] está guardado correctamente en Base de datos");
        }        
        
        //realizmaos el commit y cerramos la sesión
        tx.commit();
        s.close();
        
        return mapping.findForward(nextPage);
    }
}


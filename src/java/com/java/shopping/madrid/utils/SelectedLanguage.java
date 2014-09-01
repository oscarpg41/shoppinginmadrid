package com.java.shopping.madrid.utils;


import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.Globals;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

public class SelectedLanguage extends DispatchAction {


    public ActionForward english(ActionMapping mapping,ActionForm form,
		HttpServletRequest request,HttpServletResponse response)
	throws Exception {

        request.getSession().setAttribute(Globals.LOCALE_KEY, Locale.ENGLISH);
        
        //hay que borrar de memoria la lista de las categorias de las tiendas ya que 
        //se guarda en memoria traducida al idioma
        request.getSession().setAttribute(Constants.selectTypeShop, null);

        String page = request.getSession().getAttribute("page").toString();
        response.sendRedirect(page);

        //return mapping.findForward("success");
        return null;
    }
    

    public ActionForward spanish(ActionMapping mapping,ActionForm form,
		HttpServletRequest request,HttpServletResponse response)
	throws Exception {
 
        Locale lCastellano = new Locale("ES","");
        request.getSession().setAttribute(Globals.LOCALE_KEY, lCastellano);
        String idioma = request.getSession().getAttribute(Globals.LOCALE_KEY).toString();
        
        //hay que borrar de memoria la lista de las categorias de las tiendas ya que 
        //se guarda en memoria traducida al idioma
        request.getSession().setAttribute(Constants.selectTypeShop, null);    

        String page = request.getSession().getAttribute("page").toString();
        response.sendRedirect(page);

        //return mapping.findForward("success");
        return null;
    }

}

<%@page import="com.java.shopping.madrid.utils.Constants"%>
<%@page import="com.java.shopping.madrid.models.Login"%>
<%@page import="java.util.Locale"%>
<%@page import="org.apache.struts.Globals"%>


<%
    String userName = "";
    String listadoAreas = "";
    String listadoStreets = "";
    String listadoDepartments = "";
    String listadoMarkets = "";    
    String listadoCC = "";
    String message = "";
    String class_text_msg = "";
    String listadoTypeShops = "";
    
    try{
        //recuperamos el userLogin de la sesion. Se ha guardado en LoginAction
        Login login = (Login)request.getSession().getAttribute("userLogin");
        userName    = login.getName();

        //Vamos a definir el idioma del navegador por defecto como español
        if (request.getSession().getAttribute(Globals.LOCALE_KEY) == null){
            Locale lCastellano = new Locale("ES","");
            request.getSession().setAttribute(Globals.LOCALE_KEY, lCastellano);            
        }        
        
        /*
         * Recuperamos todas las listas que se necesitan en el portal de administración
         */
        //listado de Areas para mostrar en el select
        listadoAreas = ((String) request.getSession().getAttribute(Constants.selectAreas));
        //listado de Calles para mostrar en el select
        listadoStreets = ((String) request.getSession().getAttribute(Constants.selectStreets));        
        //listado de grandes almacenes para mostrar en el select
        listadoDepartments = ((String) request.getSession().getAttribute(Constants.selectDepartments));
        //listado de los centros comerciales para mostrar en el select
        listadoCC = ((String) request.getSession().getAttribute(Constants.selectMalls));
        //listado de Areas para mostrar en el select
        listadoMarkets = ((String) request.getSession().getAttribute(Constants.selectMarkets));
        //listado de las categorias para mostrar en el select
        listadoTypeShops = ((String) request.getSession().getAttribute(Constants.selectTypeShop));
        
        
        /*
         * Recuperamos los mensajes resultantes de cada operación de insert /update / delete
        */
        message = (String)request.getSession().getAttribute("message");
        if (message == null){ message=""; }
        class_text_msg  = ((String) request.getSession().getAttribute("class-text-msg"));
        
        request.getSession().setAttribute("class-text-msg", null);
        request.getSession().setAttribute("message", null);        
    }
    catch (Exception ex){
        response.sendRedirect("index.jsp");        
    }    
%>

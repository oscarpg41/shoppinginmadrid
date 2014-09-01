<%@page import="com.java.shopping.madrid.utils.Utilities"%>
<%@page import="com.java.shopping.madrid.utils.Constants"%>
<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.Locale"%>
<%
    //Vamos a definir el idioma del navegador por defecto como inglés
    if (request.getSession().getAttribute(Globals.LOCALE_KEY) == null){
        request.getSession().setAttribute(Globals.LOCALE_KEY, Locale.ENGLISH);
    }
    
    //Instanciamos la clase Utilities
    Utilities utils= new Utilities();
                
    //Vamos a comprobar si estan todas las listas guardadas en sesión
    utils.checkAllList(request);

    //listado de Areas para mostrar en el select
    String listadoAreas = ((String) request.getSession().getAttribute(Constants.selectAreas));
    //listado de Calles para mostrar en el select
    String listadoStreets = ((String) request.getSession().getAttribute(Constants.selectStreets));
    //listado de grandes almacenes para mostrar en el select
    String listadoDepartments = ((String) request.getSession().getAttribute(Constants.selectDepartments));
    //listado de los centros comerciales para mostrar en el select
    String listadoCC = ((String) request.getSession().getAttribute(Constants.selectMalls));
    //listado de Areas para mostrar en el select
    String listadoMarkets = ((String) request.getSession().getAttribute(Constants.selectMarkets));
    //listado de las categorias para mostrar en el select
    String listadoTypeShops = ((String) request.getSession().getAttribute(Constants.selectTypeShop));


    //recuperamos el nombre de la página
    session.setAttribute("page", request.getRequestURL().toString());
%>
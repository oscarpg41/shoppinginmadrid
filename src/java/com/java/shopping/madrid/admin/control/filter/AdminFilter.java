package com.java.shopping.madrid.admin.control.filter;

import com.java.shopping.madrid.models.Login;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;

public class AdminFilter implements Filter {

    private static Logger log = Logger.getLogger(AdminFilter.class);
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        log.info("xxxxxxxxxx");
        log.info("xxxxxxxxxx");
        log.info("xxxxxxxxxx");
        log.info("xxxxxxxxxx");
        log.info("xxxxxxxxxx");
        log.info("::doFilter()");
        
        //Obtenemos un HttpServletRequest con un casting
        HttpServletRequest requestMod = ((HttpServletRequest) request);
        if (isPermited(requestMod) == false){
            requestMod.getSession().setAttribute("requestedPage", requestMod.getRequestURL().toString());
            
            log.info(requestMod.getRequestURL().toString());
            
            
            RequestDispatcher noPermited = request.getRequestDispatcher("../paginasError/restricted.jsp");
            //RequestDispatcher noPermited = request.getRequestDispatcher("../admin-shop.jsp");
            log.info("::SEND TO INDEX");
            noPermited.forward(request, response);

            
        }else{
            //Continua la secuencia de ejecución normal
            log.info("::Continua la secuencia de ejecución normal");
            chain.doFilter(request, response);
        }
    }

    private boolean isPermited(HttpServletRequest request) {
        
        Login userLogin  =   (Login)request.getSession().getAttribute("userLogin");
        Boolean auth     = (Boolean)request.getSession().getAttribute("auth");

        
        log.info("userLogin["+ userLogin +"] auth["+ auth +"]");
        
        if ( userLogin != null && auth == true){
            return true;
        } else{
            return false;
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }
}

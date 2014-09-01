/**
 * Principal.java
 *
 * Esta clase no tiene nada que ver con el proyecto. La incluyo por que en ensta clase si
 * que funciona correctamente el sistema de log y crea un fichero de texto con las lineas de mensajes.
 * El nombre del fichero de texto lo recoje del fichero log4j.properties 
 *  - log4j.appender.archivo.file=archivo.log
 * Este fichero se crea en el directorio raiz del proyecto netbeans
 * 
 */
package com.java.shopping.madrid.servlet.actions.login;

import org.apache.log4j.Logger;

/**
 * @author Alex
 * @version 1.0
 * @author-mail programadorjavablog@gmail.com
 * @date 15/04/2011
 */
public class Principal
{
    private static Logger log = Logger.getLogger(Principal.class);

    /**
     * @param args argumentos recibidos por la linea de comandos
     */
    public static void main(String[] args)
    {
        if (log.isTraceEnabled())
        {
            log.trace("mensaje de trace");
        }

        if (log.isDebugEnabled())
        {
            log.debug("mensaje de debug");
        }

        if (log.isInfoEnabled())
        {
            log.info("mensaje de info");
        }
        
        log.warn("mensaje de warn...");
        log.error("mensaje de error...");
        log.fatal("mensaje de fatal...");
    }
}

package com.java.shopping.madrid.utils;

public final class Constants {

    private Constants() {}
    

    public static final String SUCCESS = "success";
    public static final String ERROR   = "error";
    
    public static final String userLogin = "userLogin";
    
    public static final String PathLogFileName = "../logs/";
    public static final String LogFileName     = "shoppingMadrid";
    
    public static final String PrefixAction   = ""; // PARA PRODUCCION 
    //public static final String PrefixAction   = "shoppinginmadrid"; // PARA DESARROLLO
    
    // información de los selects de los diversos apartados y que se guardan en sesion
    public static final String selectAreas          = "selectAreas";
    public static final String selectStreets        = "selectStreets";
    public static final String selectTypeShop       = "selectTypeShop";
    public static final String selectDepartments    = "selectDepartments";    
    public static final String selectMalls          = "selectMalls";
    public static final String selectMarkets        = "selectMarkets";
    
    // información de una tienda y que se guarda en sesion
    public static final String infoShop = "infoShop";
    // información de un centro comercial y que se guarda en sesion
    public static final String infoMall = "infoMall";


    // mensajes para mostrar el resultado de las operaciones
    public static final String message        = "message";
    public static final String class_text_msg = "class-text-msg";
    
    // images
    public static final int IMAGE_WIDTH  = 400;
    public static final int IMAGE_HEIGHT = 400;

    public static final String PATH_IMAGES_MALLS   = "images\\malls\\";
    public static final String PATH_IMAGES_MARKETS = "images\\markets\\";
    public static final String PATH_IMAGES_SHOPS   = "images\\shops\\";
    
    
    
    // formulario de contacto
    public static final String MAIL_SMTP_HOST = "smtp.gmail.com";
    public static final String MAIL_SMTP_PORT = "587";
    //cuenta desde la que se envía
    public static final String MAIL_SMTP_USER = "oscarpg41@gmail.com";
    public static final String MAIL_SMTP_PASS = "Murcielago4";
    public static final String MAIL_SUBJECT = "ShoppingInMadrid. Contacto desde la Web";
    //cuenta de correo donde se recibe el email enviado
    public static final String MAIL_ACCOUNT_TO_SEND = "oskar@comomolo.com";
    
    
    // contantes para la paginación de las tiendas en la parte pública
    public static final int TAMANYO_PAGINA   = 12;
    
    
    public static final String URL_PDF_METRO_MADRID = "https://www.metromadrid.es/export/sites/metro/comun/documentos/planos/Planoesquematicoespanol.pdf";
}

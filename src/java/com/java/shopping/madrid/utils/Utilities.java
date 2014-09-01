package com.java.shopping.madrid.utils;

import com.java.shopping.madrid.hibernate.HibernateUtil;
import com.java.shopping.madrid.models.Areas;
import com.java.shopping.madrid.models.DepartmentStore;
import com.java.shopping.madrid.models.Login;
import com.java.shopping.madrid.models.Mall;
import com.java.shopping.madrid.models.Markets;
import com.java.shopping.madrid.models.Streets;
import com.java.shopping.madrid.models.TypeShop;
import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.net.InetAddress;
import java.security.MessageDigest;
import java.util.List;
import java.util.StringTokenizer;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.upload.FormFile;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.apache.log4j.Logger;
import org.apache.struts.Globals;



public class Utilities {

    private static final int IMG_WIDTH = 400;
    private static final int IMG_HEIGHT = 400;
    
    private static Logger log = Logger.getLogger(Utilities.class);
        
    private static File File(String pathName) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    /**
     * Constructor de la clase abstracta
     */
    public Utilities(){}
    
    /**
    * Encripta un String con el algoritmo MD5.
    * @return El algoritmo encriptado
    * @param palabra
    */
    public String encriptarMD5(String palabra){
        String pe="";
        try {
            pe = hash(palabra);
        }
        catch (Exception e) {
            throw new Error("Error: Al encriptar el password");
        }
        return pe;
    }

    /**
    * Encripta un String con el algoritmo MD5.
    * Reemplazar la palabara MENOR por el simbolo de menor
    * @return String
    * @throws Exception
    */
    private String hash(String clear) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] b = md.digest(clear.getBytes());
        int size = b.length;
        StringBuffer h = new StringBuffer(size);
        for (int i = 0; i < size; i++){
            int u = b[i]&255 ; 
            if (u<16){
                h.append("0"+Integer.toHexString(u));
            }else {
                h.append(Integer.toHexString(u));
            }
        }
        return h.toString();
    }
    
    
    /**
     * Función que limpia las variables de sesion que se usan para mostrar mensajes al usuario
     */
    public void clearMessage(HttpServletRequest request){
        request.getSession().setAttribute("message", null);
        request.getSession().setAttribute("class-text-msg", null);
    }
    
    /**
     * Función que comprueba si el usuario es Admin
     */
    public boolean userIsAdmin(HttpServletRequest request){
        Login login = (Login)request.getSession().getAttribute("userLogin");
        if (login.getLevel() == 0){ //Administrador
            return true;
        }
        else{
            return false;
        }
    }
    
    
    /**
     * Función que sube un fichero al servidor
     * @param myFile
     * @param filePath
     * @return boolean
     */
    public boolean uploadImageToServer(FormFile myImage, String filePath, int id){
    
        try {

            String contentType = myImage.getContentType();

            //Get the file name
            String fileName  = myImage.getFileName();

            //Get the servers upload directory real path name            
            filePath = filePath.replace("\\build","");
            
            //Contruimos el nombre de la imagen.
            //El nombre sera el idMall + extensión de la imagen que hemos subido
            //ejmplo: 5.jpg, 6.gif ....
            String newFileName = buildFileNameImage( fileName, id );
            log.debug("uploadImageToServer(): newFileName["+ newFileName +"]");
            
            
            /* Save file on the server */
            if(!fileName.equals("")){

                //Create file.
                //la imagen original la guardamos con el texto "original_" al principio.
                String originImage = "original_" + newFileName;
                File fileToCreate = new File(filePath, originImage);

                FileOutputStream fileOutStream = new FileOutputStream(fileToCreate);
                fileOutStream.write(myImage.getFileData());

                fileOutStream.flush();
                fileOutStream.close();
                    
                    
                //redimensionamos la imagen
                String pathName = filePath + originImage;
                log.debug("uploadImageToServer(): Imagen Original["+ pathName +"]");
                    
                BufferedImage originalImage = ImageIO.read(new File(pathName));
                int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
 
                //BufferedImage resizeImageJpg = resizeImage(originalImage, type);
                BufferedImage resizeImageJpg = resizeImageWithHint(originalImage, type);
                pathName = filePath + newFileName;
                ImageIO.write(resizeImageJpg, "jpg", new File(pathName));

                //Borrar la imagen original
                fileToCreate.delete();
                    
            }    
    
             log.info("uploadImageToServer(): Fichero creado ["+ filePath + newFileName +"]");
            
            return true;
    
        } catch (Exception ex) {
            log.error("uploadImageToServer(): Exception:"+ ex.getMessage() );
            return false;
        }

    }
    
    /*
    Este método se utiliza para cargar la imagen de disco
    */
    public static BufferedImage loadImage(String pathName) {
        BufferedImage bimage = null;
        
        try {
            bimage = ImageIO.read(File(pathName));
        } catch (Exception e) {
            e.printStackTrace();
        }        
        
        return bimage;
    }
    
    
    /**
     * Este método se utiliza para contruir el nombre de la imagen que vamos a subir al servidor
     * Como nombre usa el identificador generado en la nueva inserción en la base de datos
     * y se le añade la extensión que tiene la imagen que hemos subido
     *
     * @param fileName
     * @param idGenerado
     * @return 
     */
    public String buildFileNameImage(String fileName, int idGenerado) {
        
        StringTokenizer st = new StringTokenizer(fileName,".");
        int lgToken = st.countTokens();
            
        String[] datos=new String[lgToken];
        int i=0;
        while (st.hasMoreTokens()){
            datos[i]=st.nextToken();
            i++;
        }
        
        String newName = String.valueOf(idGenerado) + "." + datos[lgToken-1];
        
        return newName.toLowerCase();
    }    
    
    
    private static BufferedImage resizeImage(BufferedImage originalImage, int type){
        
        int w = originalImage.getWidth();
        int h = originalImage.getHeight();    

        int newW = (w*IMG_HEIGHT) / h;
    
        log.debug("resizeImage(): Height["+ IMG_HEIGHT +"] Width["+ newW +"]" );
        
	BufferedImage resizedImage = new BufferedImage(newW, IMG_HEIGHT, type);
	Graphics2D g = resizedImage.createGraphics();
	g.drawImage(originalImage, 0, 0, newW, IMG_HEIGHT, null);
	g.dispose();
 
	return resizedImage;
    }
 
    private static BufferedImage resizeImageWithHint(BufferedImage originalImage, int type){
 
        int w = originalImage.getWidth();
        int h = originalImage.getHeight();    

        int newW = (w*IMG_HEIGHT) / h;
        
        log.debug("resizeImageWithHint(): Height["+ IMG_HEIGHT +"] Width["+ newW +"]" );
        
        BufferedImage resizedImage = new BufferedImage(newW, IMG_HEIGHT, type);
	Graphics2D g = resizedImage.createGraphics();
	g.drawImage(originalImage, 0, 0, newW, IMG_HEIGHT, null);
	g.dispose();	
	g.setComposite(AlphaComposite.Src);
 
	g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
	RenderingHints.VALUE_INTERPOLATION_BILINEAR);
	g.setRenderingHint(RenderingHints.KEY_RENDERING,
	RenderingHints.VALUE_RENDER_QUALITY);
	g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
	RenderingHints.VALUE_ANTIALIAS_ON);
 
	return resizedImage;
    }    
    
    /**
     * Borra un fichero (imagen) del directorio correspondiente
     * @param id
     * @param type
     * @return 
     */
    public boolean deleteFile(int id, String pathName){
        
        //File fichero = new File("fichero.txt");
        log.debug("deleteFile(): pathName["+ pathName +"]");
        log.debug("deleteFile(): id["+ id +"]");
        
        //Get the servers upload directory real path name            
        pathName = pathName.replace("\\build","");
        pathName = pathName.replace("\build","");
        log.debug("deleteFile(): pathName["+ pathName +"]");
        
        String deleteFileName = id +".jpg";
        log.debug("deleteFile(): deleteFileName["+ deleteFileName +"]");
            
        File fileToCreate = new File(pathName, deleteFileName);
        fileToCreate.delete();        

        return true;
    }
    
    /**
     * Método que comprueba si la lista de las areas está en sesión.
     * Si no está en sesión se busca la información y se guarda en sesión
     */    
    public void checkSelectAreas(HttpServletRequest request){
        
        String selectAreas = (String)request.getSession().getAttribute(Constants.selectAreas);
        log.debug("checkSelectAreas(): Listado de areas["+ selectAreas +"]");
        
        if (selectAreas == null || selectAreas.length() == 0){
            //recuperamos de base de datos el listado de areas
            selectAreas = "";
            
            List<Areas> listAreas = getAreas();
            selectAreas = buildSelectAreas(listAreas);

            // guardamos en sesion el listado de las areas guardados en la base de datos
            request.getSession().setAttribute(Constants.selectAreas, selectAreas);
            log.debug("checkSelectAreas(): Listado de areas["+ selectAreas +"]");            
        }        
    }
    /**
     * método que recupera las areas guardadas en base de datos
     * @return List<Areas> 
     */
    public List<Areas> getAreas() {        
        
        try{
            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction(); 

            //recuperamos todas las áreas existentes
            //usamos una query definida en Areas.hbm.xml
            Query q = s.getNamedQuery("listAreas");
            List<Areas> result = (List<Areas>)q.list();

            tx.commit();
            s.close();
            return result;
        }
        catch (Exception ex){
            log.error("getAreas(). ERROR:" +ex.getMessage());
            return null;
        }
    }    
    /**
     * método que transfoma un List<Areas> en un string con los diversos options de un <select>
     * @return String 
     */
    public  String buildSelectAreas(List<Areas> listAreas) {
    
        String selectAreas = "";
        for (Areas a: listAreas){
            selectAreas += "<option value="+ a.getIdArea() +">"+ a.getName() +"</option>";
        }
        return selectAreas;
    }
    
    /**
     * método que recupera un area guardada en base de datos
     * param idArea
     * @return List<Areas> 
     */
    public Areas getArea(int idArea) {        
        
        try{
            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction(); 

            Query q = s.getNamedQuery("getAreaById");
            q.setParameter("idArea", idArea);
            Areas result = (Areas)q.uniqueResult();

            tx.commit();
            s.close();
            return result;
        }
        catch (Exception ex){
            log.error("getAreas(). ERROR:" +ex.getMessage());
            return null;
        }
    }
    
    /**
     * método que recupera un area guardada en base de datos
     * param idArea
     * @return List<Areas> 
     */
    public Streets getStreet(int idStreet) {        
        
        try{
            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction(); 

            Query q = s.getNamedQuery("getStreetById");
            q.setParameter("idStreet", idStreet);
            Streets result = (Streets)q.uniqueResult();

            tx.commit();
            s.close();
            return result;
        }
        catch (Exception ex){
            log.error("getStreet(). ERROR:" +ex.getMessage());
            return null;
        }
    }    
    
    /**
     * Método que comprueba si la lista de las categorias de las tiendas está en sesión.
     * Si no está en sesión se busca la información y se guarda en sesión
     *
     */    
    public void checkSelectTypeShop(HttpServletRequest request){
      
        //Vamos a comprobar si esta la lista de categorias en sesión
        String selectTypeShops = (String)request.getSession().getAttribute(Constants.selectTypeShop);
        String idioma = request.getSession().getAttribute(Globals.LOCALE_KEY).toString();
        if (idioma.equals("es_ES")){
            idioma = "es";
        }
        log.debug("checkSelectTypeShop(): Listado de Categorias:"+ selectTypeShops );
        log.debug("checkSelectTypeShop(): idioma: " + idioma);

        if (selectTypeShops == null || selectTypeShops.length() == 0){
            //recuperamos de base de datos el listado de las categorias
            selectTypeShops = "";
            
            List<TypeShop> listTypeShops = getTypeShop(idioma);
            selectTypeShops = buildSelectTypeShop(listTypeShops, idioma);
            
            //guardamos en sesion el nuevo listado de las categorias
            request.getSession().setAttribute(Constants.selectTypeShop, selectTypeShops);
            log.debug("checkSelectTypeShop(): Listado de Categorias:"+ selectTypeShops );
        }        
    } 
    /**
     * método que recupera las categorias (el nomre en el idiioma correspondiente) guardadas en base de datos
     * param: String idioma
     * @return List<TypeShop> 
     */
    public List<TypeShop> getTypeShop(String idioma) {        
        try{
            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction(); 
            
            String queryName = "listTypeShop" + idioma.toUpperCase();

            //recuperamos todas las áreas existentes
            //usamos una query definida en TypeShop.hbm.xml
            Query q = s.getNamedQuery(queryName);
            List<TypeShop> result = (List<TypeShop>)q.list();

            tx.commit();
            s.close();
            return result;
        }
        catch (Exception ex){
            log.error("getTypeShop(). ERROR:" +ex.getMessage());
            return null;
        }
    }    
    /**
     * método que transfoma un List<TypeShop> en un string con los diversos options de un <select>
     * @return String 
     */
    public String buildSelectTypeShop(List<TypeShop> listTypeShops, String idioma) {
    
        String selectTypeShops = "";
        String name ="";
             for (TypeShop a: listTypeShops){
                if (idioma.equals("en")){ name = a.getName_en(); }
                                    else{ name = a.getName_es(); }
                selectTypeShops += "<option value="+ a.getIdType()+">"+ name +"</option>";
            }

        return selectTypeShops;
    }    
    
/**
     * método que recupera un area guardada en base de datos
     * param idArea
     * @return List<Areas> 
     */
    public TypeShop getTypeShopById(int idType) {        
        
        try{
            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction(); 

            Query q = s.getNamedQuery("getTypeShopById");
            q.setParameter("idType", idType);
            TypeShop result = (TypeShop)q.uniqueResult();

            tx.commit();
            s.close();
            return result;
        }
        catch (Exception ex){
            log.error("getTypeShopById(). ERROR:" +ex.getMessage());
            return null;
        }
    }    
    
    
    
    /**
     * método que recupera las grandes almacenes guardados en base de datos
     * @return List<DepartmentStore> 
     */
    
    /**
     * Método que comprueba si la lista de las grandes almacenes está en sesión.
     * Si no está en sesión se busca la información y se guarda en sesión
     */    
    public void checkSelectDepartmentStore(HttpServletRequest request){
        
        //Vamos a comprobar si esta la lista de grandes almacenes en sesión
        String selectDepartments = (String)request.getSession().getAttribute(Constants.selectDepartments);
        log.debug("checkSelectDepartmentStore(): Listado de Grandes almacenes::"+ selectDepartments );
        
        if (selectDepartments == null || selectDepartments.length() == 0){
            //recuperamos de base de datos el listado de los grandes almacenes
            selectDepartments = "";

            List<DepartmentStore> listDepartments = getDepartmentStore();
            selectDepartments = buildSelectDepartmentStore(listDepartments);
            
            // guardamos en sesion el listado de las areas guardados en la base de datos
            request.getSession().setAttribute(Constants.selectDepartments, selectDepartments);
            log.debug("checkSelectDepartmentStore(): Listado de Grandes almacenes["+ selectDepartments +"]");             
        }        
    }
    /**
     * método que recupera las areas guardadas en base de datos
     * @return List<DepartmentStore> 
     */    
    public List<DepartmentStore> getDepartmentStore() {        
        
        try{
            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction(); 

            //recuperamos todas las áreas existentes
            //usamos una query definida en DepartmentStore.hbm.xml
            Query q = s.getNamedQuery("listDepartment");
            List<DepartmentStore> result = (List<DepartmentStore>)q.list();

            tx.commit();
            s.close();
            return result;
        }
        catch (Exception ex){
           log.error("getDepartmentStore(). ERROR:" +ex.getMessage());
            return null;
        }
    }
    /**
     * método que transfoma un List<DepartmentStore> en un string con los diversos options de un <select>
     * @return String 
     */
    public  String buildSelectDepartmentStore(List<DepartmentStore> listDepartmentStore) {
    
        String selectDepartmentStore = "";
             for (DepartmentStore a: listDepartmentStore){                
                selectDepartmentStore += "<option value="+ a.getIdDepartmentStore()+">"+ a.getName()+"</option>";
            }
        return selectDepartmentStore;
    }
 
    
    
    /**
     * Método que comprueba si la lista de las grandes almacenes está en sesión.
     * Si no está en sesión se busca la información y se guarda en sesión
     */    
    public void checkSelectMalls(HttpServletRequest request){
        
        //Vamos a comprobar si esta la lista de centros comerciales en sesión
        String selectMalls = (String)request.getSession().getAttribute(Constants.selectMalls);
        log.debug("checkSelectMalls(): Listado de centros comerciales::"+selectMalls);
        
        if (selectMalls == null || selectMalls.length() == 0){
            //recuperamos de base de datos el listado de calles
            selectMalls = "";

            List<Mall> listMalls = getMalls();
            selectMalls = buildSelectMalls(listMalls);
            
            // guardamos en sesion el listado de las calles guardados en la base de datos
            request.getSession().setAttribute(Constants.selectMalls, selectMalls);
            log.debug("checkSelectMalls(): Listado de centros comerciales::"+selectMalls);
        }        
    }
    /**
     * método que recupera los centros comerciales
     * @return List<Mall> 
     */
    public List<Mall> getMalls() {        
        
        try{
            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction();

            //recuperamos todas las áreas existentes
            //usamos una query definida en Mall.hbm.xml
            Query q = s.getNamedQuery("listMall");
            List<Mall> result = (List<Mall>)q.list();

            tx.commit();
            s.close();
            return result;
        }
        catch (Exception ex){
            log.error("getMalls(). ERROR:" +ex.getMessage());
            return null;
        }
    }
    /**
     * método que transfoma un List<Mall> en un string con los diversos options de un <select>
     * @return String 
     */
    public  String buildSelectMalls(List<Mall> listMalls) {
    
        String selectMalls = "";
             for (Mall a: listMalls){                
                selectMalls += "<option value="+ a.getIdMall()+">"+ a.getName()+"</option>";
            }
        return selectMalls;
    }



    /**
     * Método que comprueba si la lista de las grandes almacenes está en sesión.
     * Si no está en sesión se busca la información y se guarda en sesión
     */    
    public void checkSelectMarkets(HttpServletRequest request){

        //Vamos a comprobar si esta la lista de mercados en sesión
        String selectMarkets = (String)request.getSession().getAttribute(Constants.selectMarkets);
        log.debug("checkSelectMarkets():Listado de mercados::"+selectMarkets);
        
        if (selectMarkets == null || selectMarkets.length() == 0){
            //recuperamos de base de datos el listado de calles
            selectMarkets = "";

            List<Markets> listMarkets = getMarkets();
            selectMarkets = buildSelectMarkets(listMarkets);
            
            // guardamos en sesion el listado de las calles guardados en la base de datos
            request.getSession().setAttribute(Constants.selectMarkets, selectMarkets);
            log.debug("checkSelectMarkets():Listado de mercados::"+selectMarkets); 
            getUrl();
        }        
    }
    
    /**
     * método que recupera los mercados
     * @return List<Markets> 
     */
    public List<Markets> getMarkets() {        
        
        try{
            //Conexion con hibernate y base de datos
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = s.beginTransaction();

            //recuperamos todas las áreas existentes
            //usamos una query definida en Markets.hbm.xml
            Query q = s.getNamedQuery("listMarkets");
            List<Markets> result = (List<Markets>)q.list();

            tx.commit();
            s.close();
            return result;
        }
        catch (Exception ex){
            log.error("getMarkets(). ERROR:" +ex.getMessage());
            return null;
        }
    }
    /**
     * método que transfoma un List<Markets> en un string con los diversos options de un <select>
     * @return String 
     */
    public String buildSelectMarkets(List<Markets> listMarkets) {
    
        String selectMarkets = "";
             for (Markets a: listMarkets){                
                selectMarkets += "<option value="+ a.getIdMarket()+">"+ a.getName()+"</option>";
            }
        return selectMarkets;
    }
    
    /**
     * metodo que llama a todas las funciones para recuperar la información de base de datos
     * @param request 
     */
    public void checkAllList(HttpServletRequest request){
        
        //Vamos a comprobar si esta la lista de las zonas comeciales en sesión
        checkSelectAreas(request);

        //Vamos a comprobar si esta la lista de categorias de tiendas en sesión
        checkSelectTypeShop(request);

        //Vamos a comprobar si esta la lista de grandes almacenes en sesión
        checkSelectDepartmentStore(request);

        //Vamos a comprobar si esta la lista de los centros comerciales en sesión
        checkSelectMalls(request);

        //Vamos a comprobar si esta la lista de los mercadoss en sesión
        checkSelectMarkets(request);        
        
    }
    
    
    public void getUrl(){
        try {
            
           InetAddress direccion = InetAddress.getLocalHost();          
           log.error("GETURL:::::" + direccion.toString());

            
    } catch (Exception ex) {
            ex.printStackTrace();
     }        
    }

}

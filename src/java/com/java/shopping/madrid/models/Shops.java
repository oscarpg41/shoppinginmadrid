package com.java.shopping.madrid.models;
// Generated 15-abr-2014 10:26:13 by Hibernate Tools 3.6.0

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

/**
 * Shops generated by hbm2java
 */
public class Shops extends ActionForm implements java.io.Serializable {

     private Integer idShop;
     private String name;
     private int idStreet;
     private int number;
     private int zip;
     private int idArea;
     private String metro;
     private String web;
     private int idType;
     
    private FormFile theFile; 

    public Shops() {
    }

    public Shops(String name, int idStreet, int number, int zip, int idArea, String metro, String web, int idType) {
       this.name = name;
       this.idStreet = idStreet;
       this.number = number;
       this.zip = zip;
       this.idArea = idArea;
       this.metro = metro;
       this.web = web;
       this.idType = idType;
    }
   
    public Integer getIdShop() {
        return this.idShop;
    }
    public void setIdShop(Integer idShop) {
        this.idShop = idShop;
    }

    public String getName() {
        return this.name;
    }
    public void setName(String name) {
        this.name = name;
    }
    
    public int getIdStreet() {
        return this.idStreet;
    }
    public void setIdStreet(int idStreet) {
        this.idStreet = idStreet;
    }
    
    public int getNumber() {
        return this.number;
    }
    public void setNumber(int number) {
        this.number = number;
    }
    
    public int getZip() {
        return this.zip;
    }
    public void setZip(int zip) {
        this.zip = zip;
    }
    
    public int getIdArea() {
        return this.idArea;
    }
    public void setIdArea(int idArea) {
        this.idArea = idArea;
    }
    
    public String getWeb() {
        return this.web;
    }
    public void setWeb(String web) {
        this.web = web;
    }
    
    public String getMetro() {
        return this.metro;
    }
    public void setMetro(String metro) {
        this.metro = metro;
    }

    public int getIdType() {
        return this.idType;
    }
    public void setIdType(int idType) {
        this.idType = idType;
    }

    /**
    * @return Returns the theFile.
    */
    public FormFile getTheFile() {
        return theFile;
    }
    /**
    * @param theFile The FormFile to set.
    */
    public void setTheFile(FormFile theFile) {
        this.theFile = theFile;
    }    
}
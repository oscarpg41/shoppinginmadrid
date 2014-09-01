package com.java.shopping.madrid.models;
// Generated 15-abr-2014 10:26:13 by Hibernate Tools 3.6.0

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

/**
 * Mall generated by hbm2java
 */
public class Mall extends ActionForm implements java.io.Serializable {


     private Integer idMall;
     private String name;
     private String street;
     private String number;
     private int zip;
     private int idArea;
     private String web;
     private String metro;
     private String descriptionEs;
     private String descriptionEn;
     private String maps;
     
     private FormFile theFile;

     
    public Mall() {
    }

    public Mall(String name, String street, String number, int zip, int idArea, String web,  String metro, String descriptionEs, String descriptionEn, String maps) {
       this.name = name;
       this.street = street;
       this.number = number;
       this.zip = zip;
       this.idArea = idArea;
       this.web = web;
       this.metro = metro;
       this.descriptionEs = descriptionEs;
       this.descriptionEn = descriptionEn;
       this.maps = maps;
    }
   
    public Integer getIdMall() {
        return this.idMall;
    }
    public void setIdMall(Integer idMall) {
        this.idMall = idMall;
    }
    
    public String getName() {
        return this.name;
    }
    public void setName(String name) {
        this.name = name;
    }
    
    public String getStreet() {
        return this.street;
    }
    public void setStreet(String street) {
        this.street = street;
    }
    
    public String getNumber() {
        return this.number;
    }
    public void setNumber(String number) {
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
    
    public String getDescriptionEs() {
        return this.descriptionEs;
    }
    public void setDescriptionEs(String descriptionEs) {
        this.descriptionEs = descriptionEs;
    }
    
    public String getDescriptionEn() {
        return this.descriptionEn;
    }
    public void setDescriptionEn(String descriptionEn) {
        this.descriptionEn = descriptionEn;
    }
    
    public String getMaps() {
        return this.maps;
    }
    public void setMaps(String maps) {
        this.maps = maps;
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


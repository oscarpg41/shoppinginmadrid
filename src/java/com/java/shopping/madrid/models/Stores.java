package com.java.shopping.madrid.models;
// Generated 15-abr-2014 10:26:13 by Hibernate Tools 3.6.0

import org.apache.struts.action.ActionForm;

/**
 * Stores generated by hbm2java
 */
public class Stores extends ActionForm implements java.io.Serializable {


     private Integer idStore;
     private int idStreet;
     private int number;
     private int zip;
     private int idArea;
     private String web;
     private String image;
     private int idDepartmentStore;

    public Stores() {
    }

    public Stores(int idStreet, int number, int zip, int idArea, String web, String image, int idDepartmentStore) {
       this.idStreet = idStreet;
       this.number = number;
       this.zip = zip;
       this.idArea = idArea;
       this.web = web;
       this.image = image;
       this.idDepartmentStore = idDepartmentStore;
    }
   
    public Integer getIdStore() {
        return this.idStore;
    }
    
    public void setIdStore(Integer idStore) {
        this.idStore = idStore;
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
    public String getImage() {
        return this.image;
    }
    
    public void setImage(String image) {
        this.image = image;
    }
    public int getIdDepartmentStore() {
        return this.idDepartmentStore;
    }
    
    public void setIdDepartmentStore(int idDepartmentStore) {
        this.idDepartmentStore = idDepartmentStore;
    }




}



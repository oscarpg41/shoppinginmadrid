package com.java.shopping.madrid.models;
// Generated 15-abr-2014 10:26:13 by Hibernate Tools 3.6.0

import org.apache.struts.action.ActionForm;

/**
 * Areas generated by hbm2java
 */
public class Areas extends ActionForm implements java.io.Serializable {

     private Integer idArea;
     private String name;
     private String descriptionEs;
     private String descriptionEn;     

    public Areas() {
    }

    public Areas(String name, String descriptionEs, String descriptionEn) {
       this.name = name;
       this.descriptionEs = descriptionEs;
       this.descriptionEn = descriptionEn;       
    }
   
    public Integer getIdArea() {
        return this.idArea;
    }
    
    public void setIdArea(Integer idArea) {
        this.idArea = idArea;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
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
}
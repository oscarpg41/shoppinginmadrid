package com.java.shopping.madrid.models;
// Generated 15-abr-2014 10:26:13 by Hibernate Tools 3.6.0

import org.apache.struts.action.ActionForm;

/**
 * Areas generated by hbm2java
 */
public class Contact extends ActionForm implements java.io.Serializable {

     private String name;
     private String email;
     private String subject;     
     private String text;     

    public Contact() {
    }

    public Contact(String name, String email, String subject, String text) {
       this.name = name;
       this.email = email;
       this.subject = subject;
       this.text = text;
    }
   
    public String getName() {
        return this.name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return this.email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getSubject() {
        return this.subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }    

    public String getText() {
        return this.text;
    }
    public void setText(String text) {
        this.text = text;
    }

}



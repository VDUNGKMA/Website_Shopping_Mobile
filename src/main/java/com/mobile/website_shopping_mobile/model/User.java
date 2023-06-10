package com.mobile.website_shopping_mobile.model;

public class User {
    private int id ;
    private String uho;
    private String uten;
    private String uemail;
    private String uname;
    private String upassword;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUho() {
        return uho;
    }

    public void setUho(String uho) {
        this.uho = uho;
    }

    public String getUten() {
        return uten;
    }

    public void setUten(String uten) {
        this.uten = uten;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }
}

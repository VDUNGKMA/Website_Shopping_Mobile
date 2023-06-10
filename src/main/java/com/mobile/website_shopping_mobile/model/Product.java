package com.mobile.website_shopping_mobile.model;

public class Product extends Category{
    private  int id;
    private String name;
    private int categoryid;
    private double price ;
    private String image;
    private String discripsion;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDiscripsion() {
        return discripsion;
    }

    public void setDiscripsion(String discripsion) {
        this.discripsion = discripsion;
    }
}

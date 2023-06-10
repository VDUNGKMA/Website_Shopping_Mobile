package com.mobile.website_shopping_mobile.model;

public class Cart extends Product{
    private int quantity;
    private double totalPrice;
    public Cart() {
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}

package com.mobile.website_shopping_mobile.dao;

import com.mobile.website_shopping_mobile.model.Cart;
import com.mobile.website_shopping_mobile.model.Category;
import com.mobile.website_shopping_mobile.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductDao {
    private Connection connection;
    private String query;
    private PreparedStatement statement;
    private ResultSet rs;

    public ProductDao(Connection connection) {
        this.connection = connection;
    }

    public List<Category> getAllCategory() {
        List<Category> categories = new ArrayList<>();
        try {
            query = "select * from category ";
            statement = this.connection.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                Category row = new Category();
                row.setId(rs.getInt("id"));
                row.setCategoryName(rs.getString("name_category"));
                row.setLogo(rs.getString("logo"));
                categories.add(row);
            }


        } catch (Exception e) {

        }

        return categories;
    }

    public List<Product> getAllProduct() {
        List<Product> products = new ArrayList<>();
        try {
            query = "select * from products ";
            statement = this.connection.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                products.add(row);
            }


        } catch (Exception e) {

        }

        return products;
    }

    public List<Product> getAllProductByCategoryId(int id) {
        List<Product> products = new ArrayList<>();
        try {
            query = "select * from products where category_id=?;";
            statement = this.connection.prepareStatement(query);
            statement.setInt(1, id);
            rs = statement.executeQuery();
            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                products.add(row);
            }


        } catch (Exception e) {

        }

        return products;
    }

    public void InsertProduct(String name,int category_id,double price,String image,String discripsion){
        try {
            query ="insert into products(name,category_id,price,image,discripsion) values(?,?,?,?,?)";
            statement =this.connection.prepareStatement(query);
            statement.setString(1,name);
            statement.setInt(2,category_id);
            statement.setDouble(3,price);
            statement.setString(4,image);
            statement.setString(5,discripsion);
            statement.executeUpdate();


        }catch (Exception e){

        }
    }
    public void EditProduct(String name,int category_id,double price,String image,String discripsion,int id){
        try {
            query ="update products set name= ?,category_id=?,price=?,image=?,discripsion=? where  id=?";
            statement =this.connection.prepareStatement(query);
            statement.setString(1,name);
            statement.setInt(2,category_id);
            statement.setDouble(3,price);
            statement.setString(4,image);
            statement.setString(5,discripsion);
            statement.setInt(6,id);
            statement.executeUpdate();


        }catch (Exception e){

        }
    }

    public List<Product> getNewProduct() {
        List<Product> products = new ArrayList<>();
        try {
            query = "SELECT * FROM products order by id DESC LIMIT 5; ";
            statement = this.connection.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                products.add(row);
            }


        } catch (Exception e) {

        }

        return products;
    }

    public Product getProductById(int id) {
        Product product = new Product();
        try {
            query = "select * from products join category where category_id=category.id and products.id=?;";
            statement = this.connection.prepareStatement(query);
            statement.setInt(1, id);
            rs = statement.executeQuery();
            while (rs.next()) {
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategoryName(rs.getString("name_category"));
                product.setCategoryid(rs.getInt("category_id"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                product.setDiscripsion(rs.getString("discripsion"));
                return product;
            }


        } catch (Exception e) {

        }

        return null;
    }

    public List<Product> getProductByName(String name) {
        List<Product> products = new ArrayList<>();
        try {
            query = "select * from products where name like ?;";
            statement = this.connection.prepareStatement(query);
            statement.setString(1, "%" + name + "%");
            rs = statement.executeQuery();
            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                products.add(row);
            }


        } catch (Exception e) {

        }

        return products;
    }
    public void deleteProduct(int id){

        try {
            String query="delete from products where id=?";
            statement = this.connection.prepareStatement(query);
            statement.setInt(1,id);
            statement.executeUpdate();
        }catch (Exception e) {

        }
    }

    public List<Cart> getCartProduct(ArrayList<Cart> listCart) {
        List<Cart> products = new ArrayList<>();
        try {
            if(listCart.size() >0)
                for (Cart c: listCart) {
                    query = "select * from products where id=? ;";
                    statement = this.connection.prepareStatement(query);
                    statement.setInt(1,c.getId());
                    rs = statement.executeQuery();
                    while (rs.next()) {
                            Cart row =new Cart();
                            row.setId(rs.getInt("id"));
                            row.setName(rs.getString("name"));
                            row.setPrice(rs.getDouble("price"));
                            row.setImage(rs.getString("image"));
                            row.setTotalPrice(rs.getDouble("price") * c.getQuantity());
                            row.setQuantity(c.getQuantity());
                            row.setOrderTime(c.getOrderTime());
                            products.add(row);
                        }
                    }



        } catch (Exception e) {

        }

        return products;
    }
    public double getTotalProductPrice(ArrayList<Cart> cartList ){
            double sum=0;
            try{
                if(cartList.size() >0){
                    for (Cart item: cartList) {
                        query ="select price from products where id=?";
                        statement =this.connection.prepareStatement(query);
                        statement.setInt(1,item.getId());
                        rs =statement.executeQuery();
                        while (rs.next()){
                            sum +=rs.getDouble("price")*item.getQuantity();
                        }
                    }

                }





            }catch (Exception e){
                e.printStackTrace();
            }

        return sum;
    }
    public List<Product> getAllProductChepeat() {
        List<Product> products = new ArrayList<>();
        try {
            query = "select * from products where price <=2000000 limit 5;";
            statement = this.connection.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                products.add(row);
            }


        } catch (Exception e) {

        }

        return products;
    }public List<Product> getProduct() {
        List<Product> products = new ArrayList<>();
        try {
            query = "select * from products ";
            statement = this.connection.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                products.add(row);
            }


        } catch (Exception e) {

        }

        return products;
    }

    public List<Product> getTop5Product() {
        List<Product> products = new ArrayList<>();
        try {
            query = "select * from products limit 5";
            statement = this.connection.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                row.setCategoryid(rs.getInt("category_id"));
                row.setPrice(rs.getDouble("price"));
                row.setDiscripsion(rs.getString("discripsion"));

                products.add(row);
            }


        } catch (Exception e) {

        }

        return products;
    }
    public List<Product> getNextTop5Product(int amount) {
        List<Product> products = new ArrayList<>();
        try {
            query = "select * from products limit ?,5";
            statement = this.connection.prepareStatement(query);
            statement.setInt(1,amount);
            rs = statement.executeQuery();
            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                row.setCategoryid(rs.getInt("category_id"));
                row.setPrice(rs.getDouble("price"));
                row.setDiscripsion(rs.getString("discripsion"));

                products.add(row);
            }


        } catch (Exception e) {

        }

        return products;
    }
    public List<Product> getNextProductChepeat(int amount) {
        List<Product> products = new ArrayList<>();
        try {
            query = "select * from products where price <=2000000 limit ?,5;";
            statement = this.connection.prepareStatement(query);
            statement.setInt(1,amount);
            rs = statement.executeQuery();
            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                row.setCategoryid(rs.getInt("category_id"));
                row.setPrice(rs.getDouble("price"));
                row.setDiscripsion(rs.getString("discripsion"));
                products.add(row);
            }


        } catch (Exception e) {

        }

        return products;
    }


}
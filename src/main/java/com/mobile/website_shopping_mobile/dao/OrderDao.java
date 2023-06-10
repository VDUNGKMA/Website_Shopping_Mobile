package com.mobile.website_shopping_mobile.dao;

import com.mobile.website_shopping_mobile.model.Order;
import com.mobile.website_shopping_mobile.model.Product;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    private Connection connection;
    private String query;
    private PreparedStatement statement;
    private ResultSet rs;
    public OrderDao(Connection connection){
        this.connection=connection;
    }
    public boolean insertOrder(Order order){
        boolean result =false;
        try {
            query="Insert into orders(product_id,user_id,order_quantity,order_date) values(?,?,?,?)";
            statement =this.connection.prepareStatement(query);
            statement.setInt(1,order.getId());
            statement.setInt(2,order.getUid());
            statement.setInt(3,order.getQuantity());
            statement.setString(4,order.getDate());
            statement.executeUpdate();
            result =true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
    public List<Order> userOrder(int id){
        List<Order> list =new ArrayList<>();
        try {
            query="select * from orders where user_id= ? order by order_id desc";
            statement=this.connection.prepareStatement(query);
            statement.setInt(1,id);
            rs =statement.executeQuery();
            while (rs.next()){
                Order order =new Order();
                ProductDao productDao =new ProductDao(connection);
                int product_id =rs.getInt("product_id");
                Product product =productDao.getProductById(product_id);
                order.setOrderId(rs.getInt("order_id"));
                order.setId(product_id);
                order.setName(product.getName());
                order.setCategoryName(product.getCategoryName());
                order.setImage(product.getImage());
                order.setPrice(product.getPrice()*rs.getInt("order_quantity"));
                order.setQuantity(rs.getInt("order_quantity"));
                order.setDate(rs.getString("order_date"));
                list.add(order);


            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}

package com.mobile.website_shopping_mobile.dao;

import com.mobile.website_shopping_mobile.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterDao {
    private Connection connection;
    private String query;
    private PreparedStatement statement;
    private ResultSet rs;

    public RegisterDao(Connection connection) {
        this.connection = connection;
    }
    public User checkAccountExit(String username) throws SQLException {
        User user = new User();
        query= "select * from users where uname=?";
        statement=connection.prepareStatement(query);
        statement.setString(1,username);
        rs=statement.executeQuery();
        while (rs.next()){
           user.setUname(rs.getString("uname"));
           user.setUpassword(rs.getString("upassword"));
           user.setId(rs.getInt("id"));
           return  user;
        }
        return null;
    }
    public int addUser(String ho,String ten,String email, String username,String upassword ){
        int rowCount=0;
        try {
            query="insert into users(uho,uten,uemail,uname,upassword) values(?,?,?,?,?)";
            statement =connection.prepareStatement(query);
            statement.setString(1, ho);
            statement.setString(2, ten);
            statement.setString(3, email);
            statement.setString(4, username);
            statement.setString(5, upassword);
            rowCount= statement.executeUpdate();


        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return rowCount;

    }
}

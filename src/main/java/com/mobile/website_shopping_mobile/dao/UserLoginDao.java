package com.mobile.website_shopping_mobile.dao;

import com.mobile.website_shopping_mobile.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserLoginDao {
    private Connection connection;
    private String query;
    private PreparedStatement statement;
    private ResultSet rs;
    public UserLoginDao(Connection connection){
        super();
        this.connection=connection;
    }
    public User getUser(String username, String password){
        User user =null;
        try {
            query ="select * from users where uname=? and upassword=?";
            statement =this.connection.prepareStatement(query);
            statement.setString(1,username);
            statement.setString(2, password);
            rs=statement.executeQuery();
            if(rs.next()) {
                user= new User();
                user.setId(rs.getInt("id"));
                user.setUname(rs.getString("uname"));
                user.setUpassword(rs.getString("upassword"));
                user.setUemail(rs.getString("uemail"));
            }

        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return user;
    }
}

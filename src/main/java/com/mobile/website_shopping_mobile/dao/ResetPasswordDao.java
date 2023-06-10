package com.mobile.website_shopping_mobile.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ResetPasswordDao {
    private Connection connection;
    private String query;
    private PreparedStatement statement;
    private ResultSet rs;

    public ResetPasswordDao(Connection connection) {
        this.connection = connection;
    }
    public int resetPassword(String email,String password ){
        int rowCount=0;
        try {
            query = "update users set upassword=? where uemail=?";
            statement = connection.prepareStatement(query);
            statement.setString(1, password);
            statement.setString(2, email);

            rowCount = statement.executeUpdate();
        } catch(Exception e){
                System.out.println(e.getMessage());
            }
        return rowCount;
    }
}

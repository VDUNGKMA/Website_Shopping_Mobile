package com.mobile.website_shopping_mobile.collection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbConnection {
    private static Connection connection = null;
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if(connection == null){
            Class.forName("com.mysql.jdbc.Driver");
           connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/Shopping_Store?reconnect=true&useSSL=false",
                   "root","Password");

        }
        return connection;
    }
}

package com.mobile.website_shopping_mobile.collection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbConnection {
    private static Connection connection = null;
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if(connection == null){
            Class.forName("com.mysql.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://b500e05ec466a3:3aa0be93@eu-cdbr-west-03.cleardb.net/heroku_d7bb815ebb47537?reconnect=true&useSSL=false",
                    "b500e05ec466a3","3aa0be93");
            System.out.print("connected");
        }
        return connection;
    }
}

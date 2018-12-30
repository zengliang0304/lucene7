package com.lucene.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class mysqlClient {

    private final static String USER = PropertiesClient.DB_USER;
    private final static String PASSWORD = PropertiesClient.DB_PWD;
    private final static String DB_URL = PropertiesClient.DB_URL;

    public static Connection getConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
        } catch (Exception e) {
            System.out.println("Error while connnection....");
            e.printStackTrace();
        }
        return con;
    }

}

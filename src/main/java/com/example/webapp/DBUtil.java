package com.example.webapp;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    private static final String URL = "jdbc:mysql://dbweb.c10csoc8mw1v.us-east-2.rds.amazonaws.com:3306/dbweb";
    private static final String USER = "admin";
    private static final String PASS = "admin123";

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }
}

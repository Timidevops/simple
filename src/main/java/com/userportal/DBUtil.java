package com.userportal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String DB_HOST = getenvOrDefault("DB_HOST", "mysql");
    private static final String DB_PORT = getenvOrDefault("DB_PORT", "3306");
    private static final String DB_NAME = getenvOrDefault("DB_NAME", "userdb");
    private static final String DB_USER = getenvOrDefault("DB_USER", "timi");
    private static final String DB_PASS = getenvOrDefault("DB_PASS", "rootpass");

    private static String getenvOrDefault(String key, String def) {
        String v = System.getenv(key);
        return (v == null || v.isEmpty()) ? def : v;
    }

    public static Connection getConnection() throws SQLException {
        try {
            // Explicitly load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found", e);
        }

        String url = "jdbc:mysql://" + DB_HOST + ":" + DB_PORT + "/" + DB_NAME +
                     "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        return DriverManager.getConnection(url, DB_USER, DB_PASS);
    }
}

package com.healthcare.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String DRIVER =
            "oracle.jdbc.driver.OracleDriver";

    private static final String URL =
            "jdbc:oracle:thin:@localhost:1521:xe";

    private static final String USER =
            "MYVINOD";

    private static final String PASS =
            "SYSTEM";

    static {

        try {

            Class.forName(DRIVER);

            DatabaseInitializer.initializeDatabase();

            System.out.println(
                    "DATABASE INITIALIZED");

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    public static Connection getConnection() {

        Connection con = null;

        try {

            con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASS);

            System.out.println(
                    "DATABASE CONNECTED");

        } catch (Exception e) {

            e.printStackTrace();
        }

        return con;
    }
}
package com.petfoodmonitoring.app;

import com.petfoodmonitoring.app.config.DBConnection;
import java.sql.Connection;

public class Main {

    public static void main(String[] args) {

        Connection conn = DBConnection.getConnection();

        if (conn != null) {

            System.out.println("----------------------------");
            System.out.println("Connection Test Successful!");
            System.out.println("----------------------------");

        } else {

            System.out.println("----------------------------");
            System.out.println("Connection Test Failed!");
            System.out.println("----------------------------");

        }
    }
}

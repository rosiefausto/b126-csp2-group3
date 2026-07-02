package com.petfoodmonitoring.app.dao;

import com.petfoodmonitoring.app.config.DBConnection;
import com.petfoodmonitoring.app.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    
    public boolean addUser(User user) {

    String sql = "INSERT INTO users(first_name, last_name, email, password, phone_number) VALUES (?, ?, ?, ?, ?)";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement pst = conn.prepareStatement(sql)) {

        pst.setString(1, user.getFirstName());
        pst.setString(2, user.getLastName());
        pst.setString(3, user.getEmail());
        pst.setString(4, user.getPassword());
        pst.setString(5, user.getPhoneNumber());

        int rows = pst.executeUpdate();

        return rows > 0;

    } catch (SQLException e) {

        System.out.println(e.getMessage());

        return false;

    }
  }
    
    public void viewUsers() {

    String sql = "SELECT * FROM users";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement pst = conn.prepareStatement(sql);
         ResultSet rs = pst.executeQuery()) {

        System.out.println("\n========== USERS ==========");

        while (rs.next()) {

            System.out.println("ID: " + rs.getInt("id"));
            System.out.println("First Name: " + rs.getString("first_name"));
            System.out.println("Last Name: " + rs.getString("last_name"));
            System.out.println("Email: " + rs.getString("email"));
            System.out.println("Phone: " + rs.getString("phone_number"));

            System.out.println("------------------------------");
        }

    } catch (SQLException e) {

        System.out.println(e.getMessage());

    }
  }
    
    public void searchUser(int id) {

    String sql = "SELECT * FROM users WHERE id = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement pst = conn.prepareStatement(sql)) {

        pst.setInt(1, id);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {

            System.out.println("\n========== USER FOUND ==========");

            System.out.println("ID: " + rs.getInt("id"));
            System.out.println("First Name: " + rs.getString("first_name"));
            System.out.println("Last Name: " + rs.getString("last_name"));
            System.out.println("Email: " + rs.getString("email"));
            System.out.println("Phone: " + rs.getString("phone_number"));

        } else {

            System.out.println("\nNo user found with ID " + id);

        }

    } catch (SQLException e) {

        System.out.println(e.getMessage());

    }
  }
    
    public boolean updateUser(User user) {

    String sql = "UPDATE users SET first_name=?, last_name=?, email=?, password=?, phone_number=? WHERE id=?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement pst = conn.prepareStatement(sql)) {

        pst.setString(1, user.getFirstName());
        pst.setString(2, user.getLastName());
        pst.setString(3, user.getEmail());
        pst.setString(4, user.getPassword());
        pst.setString(5, user.getPhoneNumber());
        pst.setInt(6, user.getId());

        int rows = pst.executeUpdate();

        return rows > 0;

    } catch (SQLException e) {

        System.out.println(e.getMessage());

        return false;

    }
  }
    
    public boolean deleteUser(int id) {

    String sql = "DELETE FROM users WHERE id = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement pst = conn.prepareStatement(sql)) {

        pst.setInt(1, id);

        int rows = pst.executeUpdate();

        return rows > 0;

    } catch (SQLException e) {

    if (e.getMessage().contains("foreign key constraint")) {

        System.out.println("\n======================================");
        System.out.println("❌ Cannot delete this user.");
        System.out.println("Reason:");
        System.out.println("This user still has registered pets.");
        System.out.println("Please delete or transfer the pets first.");
        System.out.println("======================================");

    } else {

        System.out.println("Database Error: " + e.getMessage());

    }

    return false;
  }
 }
}
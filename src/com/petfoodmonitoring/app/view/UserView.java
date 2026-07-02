package com.petfoodmonitoring.app.view;

import java.util.Scanner;
import com.petfoodmonitoring.app.model.User;

public class UserView {

    private Scanner scanner = new Scanner(System.in);

    public int showUserMenu() {

        System.out.println("\n=================================");
        System.out.println("         USER MENU");
        System.out.println("=================================");
        System.out.println("1. Add User");
        System.out.println("2. View Users");
        System.out.println("3. Search User");
        System.out.println("4. Update User");
        System.out.println("5. Delete User");
        System.out.println("6. Back");
        System.out.print("Choose an option: ");

        return scanner.nextInt();
    }

    public void clearBuffer() {
        scanner.nextLine();
    }

    public String getFirstName() {
        System.out.print("Enter First Name: ");
        return scanner.nextLine();
    }

    public String getLastName() {
        System.out.print("Enter Last Name: ");
        return scanner.nextLine();
    }

    public String getEmail() {
        System.out.print("Enter Email: ");
        return scanner.nextLine();
    }

    public String getPassword() {
        System.out.print("Enter Password: ");
        return scanner.nextLine();
    }

    public String getPhoneNumber() {
        System.out.print("Enter Phone Number: ");
        return scanner.nextLine();
    }
    
    public int getUserId() {

    System.out.print("Enter User ID: ");
    return scanner.nextInt();

  }
    
    public User getUpdatedUser() {

    User user = new User();

    System.out.print("Enter User ID: ");
    user.setId(scanner.nextInt());
    scanner.nextLine();

    System.out.print("Enter New First Name: ");
    user.setFirstName(scanner.nextLine());

    System.out.print("Enter New Last Name: ");
    user.setLastName(scanner.nextLine());

    System.out.print("Enter New Email: ");
    user.setEmail(scanner.nextLine());

    System.out.print("Enter New Password: ");
    user.setPassword(scanner.nextLine());

    System.out.print("Enter New Phone Number: ");
    user.setPhoneNumber(scanner.nextLine());

    return user;
  }
    
    public int getDeleteUserId() {

    System.out.print("Enter User ID to Delete: ");
    return scanner.nextInt();

  }
}


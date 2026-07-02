package com.petfoodmonitoring.app.controller;

import com.petfoodmonitoring.app.dao.UserDao;
import com.petfoodmonitoring.app.model.User;
import com.petfoodmonitoring.app.view.UserView;

public class UserController {

    private UserDao dao = new UserDao();
    private UserView view = new UserView();

    public void start() {

        int choice;

        do {

            choice = view.showUserMenu();
            view.clearBuffer();

            switch (choice) {

                case 1:
                    addUser();
                    break;

                case 2:
                    dao.viewUsers();
                    break;

                case 3:
                    searchUser();
                    break;

                case 4:
                    updateUser();
                    break;

                case 5:
                    deleteUser();
                    break;

                case 6:
                    System.out.println("Returning to Main Menu...");
                    break;

                default:
                    System.out.println("Invalid Choice!");
            }

        } while (choice != 6);

    }

    public void addUser() {

        User user = new User();

        user.setFirstName(view.getFirstName());
        user.setLastName(view.getLastName());
        user.setEmail(view.getEmail());
        user.setPassword(view.getPassword());
        user.setPhoneNumber(view.getPhoneNumber());

        if (dao.addUser(user)) {
            System.out.println("\n✅ User added successfully!");
        } else {
            System.out.println("\n❌ Failed to add user.");
        }
    }
    
    public void searchUser() {

    int id = view.getUserId();
    view.clearBuffer();

    dao.searchUser(id);

  }
    
    public void updateUser() {

    User user = view.getUpdatedUser();

    if (dao.updateUser(user)) {
        System.out.println("\n✅ User updated successfully!");
    } else {
        System.out.println("\n❌ User not found or update failed.");
    }
  }
    
    public void deleteUser() {

    int id = view.getDeleteUserId();
    view.clearBuffer();

    if (dao.deleteUser(id)) {

        System.out.println("\n✅ User deleted successfully!");

    } else {

        System.out.println("\nDelete operation was not completed.");

    }
  }
}


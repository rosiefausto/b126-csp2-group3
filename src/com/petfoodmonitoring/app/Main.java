package com.petfoodmonitoring.app;

import com.petfoodmonitoring.app.controller.UserController;

public class Main {

    public static void main(String[] args) {

        UserController controller = new UserController();

        controller.start();

    }
}

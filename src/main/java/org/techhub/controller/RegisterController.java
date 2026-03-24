package org.techhub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.techhub.model.UserModel;
import org.techhub.service.UserService;

@Controller
public class RegisterController {

    @Autowired
    UserService userService;

    /* Show Register Page (GET) */
    @GetMapping("/register")
    public String registerPage() {
        return "register"; // resolves to /WEB-INF/views/register.jsp
    }

    /* Handle Register (POST) */
    @PostMapping("/register")
    public String registerUser(UserModel model) {
        userService.registerUser(model);
        return "login"; // after registration, go to login.jsp
    }
}
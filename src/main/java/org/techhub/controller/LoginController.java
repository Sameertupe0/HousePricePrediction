package org.techhub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.techhub.model.UserModel;
import org.techhub.service.DashboardService;
import org.techhub.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    UserService userService;
    
    @Autowired
    private DashboardService dashboardService;
    
    /* Show Login Page (GET) */
    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // resolves to /WEB-INF/views/login.jsp
    }

    /* Handle Login (POST) */
    @PostMapping("/login")
    public String loginUser(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {

        UserModel user = userService.loginUser(email, password);

        if (user != null) {
            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                session.setAttribute("admin", user); // store admin in session
                return "redirect:/admin/dashboard";
            } else if ("USER".equalsIgnoreCase(user.getRole())) {
                session.setAttribute("user", user); // store user in session
                return "redirect:/user/dashboard";
            }
        }

        model.addAttribute("msg", "Invalid Email or Password");
        return "login";
    }

    /* Logout for both User and Admin */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        if (session != null) {
            session.invalidate(); // removes all session attributes
        }
        return "redirect:/login";
    }

    /* Admin Dashboard */
    @GetMapping("/admin/dashboard")
    public String showAdminDashboard(HttpSession session,Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/login"; // prevent access after logout
        }
        
        model.addAttribute("totalUsers", dashboardService.getTotalUsers());
    	model.addAttribute("totalProperties", dashboardService.getTotalProperties());
        
        return "admin-dashboard"; // resolves to /WEB-INF/views/admin-dashboard.jsp
    }

    /* User Dashboard */
    @GetMapping("/user/dashboard")
    public String showUserDashboard(HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/login"; // prevent access after logout
        }
        return "user-dashboard"; // resolves to /WEB-INF/views/user-dashboard.jsp
    }
}
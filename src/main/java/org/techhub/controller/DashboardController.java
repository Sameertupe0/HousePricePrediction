package org.techhub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.techhub.service.DashboardService;

@Controller
public class DashboardController {
	
	@Autowired
	private DashboardService dashboardService;
	
	  @GetMapping("/dashboard")
	    public String dashboard(Authentication auth,Model model){

	        String role = auth.getAuthorities().iterator().next().getAuthority();

	        if(role.equals("ROLE_ADMIN")){
	        	
	        	
	            return "admin-dashboard";
	        }
	        else{
	            return "user-dashboard";
	        }
	    }
}
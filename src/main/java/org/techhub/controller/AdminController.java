package org.techhub.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.techhub.model.UserModel;
import org.techhub.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/users")
	public String viewUsers(Map<String, Object> map) {
		
		List<UserModel> users = adminService.getAllUsers();
		 map.put("users", users);

		 return "admin-users";
		
	}
	
	@GetMapping("/deleteUser")
	public String deleteUser(@RequestParam("id") int id) {
		adminService.deleteUser(id);
		
		return "redirect:/admin/users";
	}
	
	@GetMapping("/blockUser")
	public String blockUser(@RequestParam("id") int id) {
		adminService.blockUser(id);
		
		return "redirect:/admin/users";
	}
	
	@GetMapping("/activateUser")
	public String activateUser(@RequestParam("id") int id) {
		adminService.activateUser(id);
		
		return "redirect:/admin/users";
	}
	

}

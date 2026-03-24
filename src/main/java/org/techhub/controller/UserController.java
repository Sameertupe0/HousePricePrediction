package org.techhub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.techhub.model.Booking;
import org.techhub.model.PropertyModelUser;
import org.techhub.model.UserModel;
import org.techhub.service.BookingService;
import org.techhub.service.PropertyUserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	PropertyUserService propertyUserService;
	
	@Autowired
	BookingService bookingService;
	
	@GetMapping("/search")
	public String serachPage() {
		return "user-search";
	}
	
	@PostMapping("/searchProperty")
	public String searchProperty(@RequestParam("city") String city,@RequestParam("state") String state,Model model) {
	
		List<PropertyModelUser> list = propertyUserService.searchProperty(city, state);
		
		model.addAttribute("properties",list);
		
		return "user-search";
		
	}
	
	
	@GetMapping("/predict")
	public String viewPredictions() {
		return "predict-price";
	}
	
	
	  @GetMapping("/bookProperty")
	    public String bookProperty(@RequestParam("id") int id, HttpSession session) {
	        UserModel user = (UserModel) session.getAttribute("user");
	        if (user == null) return "redirect:/login";

	        bookingService.saveBooking(user.getId(), id);
	        return "redirect:/user/myBookings";
	    }

	    // My Bookings Page
	    @GetMapping("/myBookings")
	    public String myBookings(HttpSession session, Model model) {
	        UserModel user = (UserModel) session.getAttribute("user");
	        if (user == null) return "redirect:/login";

	        List<Booking> bookings = bookingService.getBookings(user.getId());
	        model.addAttribute("bookings", bookings);
	        model.addAttribute("user", user);

	        return "myBookings"; // JSP
	    }
	
	

}

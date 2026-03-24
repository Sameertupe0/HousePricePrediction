package org.techhub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewPredictionController {

	@GetMapping("/admin/view-predictions")
	public String viewPredictions() {
		return "view-predictions";
	}
	
}

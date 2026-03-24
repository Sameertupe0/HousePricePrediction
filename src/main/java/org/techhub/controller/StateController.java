package org.techhub.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.techhub.service.StateService;

@Controller
@RequestMapping("/admin")
public class StateController {
	@Autowired
	private StateService stateService;

	@GetMapping("/states")
	public String viewStates(Map<String, Object> map) {

		map.put("states", stateService.getAllStates());

		return "admin-states";
	}

	@PostMapping("/addState")
	public String addState(@RequestParam("name") String name) {

		stateService.addState(name);

		return "redirect:/admin/states";
	}

	@GetMapping("/deleteState")
	public String deleteState(@RequestParam("id") int id) {

		stateService.deleteState(id);

		return "redirect:/admin/states";
	}
	
}

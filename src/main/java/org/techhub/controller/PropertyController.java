package org.techhub.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.techhub.model.PropertyModel;
import org.techhub.service.CitiesService;
import org.techhub.service.PropertyService;

@Controller
@RequestMapping("/admin")
public class PropertyController {
	@Autowired
	PropertyService service;
	
	@Autowired
	CitiesService cityService;
	
	@GetMapping("/properties")
	public String properties(Map<String,Object> map) {
		map.put("properties",service.getAllProperties());
		
		map.put("cities",cityService.getAllCities());
		
		return "admin-properties";
	}
	
	@PostMapping("/addProperty")
	public String addProperty(PropertyModel p) {
		
		service.addProperty(p);
		
		return "redirect:/admin/properties";
		
	}
	
	@GetMapping("/editProperty")
    public String editProperty(@RequestParam("id") int id, Map<String,Object> map) {
        PropertyModel p = service.getPropertyById(id);
        map.put("property", p);
        map.put("cities", cityService.getAllCities());
        return "admin-edit-property";  // new JSP page for editing
    }

    /* Update Property */
    @PostMapping("/updateProperty")
    public String updateProperty(PropertyModel p) {
        service.updateProperty(p);
        return "redirect:/admin/properties";
    }

    /* Delete Property */
    @GetMapping("/deleteProperty")
    public String deleteProperty(@RequestParam("id") int id) {
        service.deleteProperty(id);
        return "redirect:/admin/properties";
    }
	
}

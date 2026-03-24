package org.techhub.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.techhub.model.CityModel;
import org.techhub.service.CitiesService;
import org.techhub.service.StateService;

@Controller
@RequestMapping("/admin")

public class CityController {
	
	@Autowired
	private CitiesService citiesService;
	
	@Autowired
	StateService stateService;
	

    @GetMapping("/cities")
    public String viewCities(Map<String,Object> map){

        map.put("cities", citiesService.getAllCities());
        
        map.put("states",stateService.getAllStates());

        return "admin-cities";
    }

    @PostMapping("/addCity")
    public String addCity(CityModel city){

    	citiesService.addCity(city);

        return "redirect:/admin/cities";
    }

    @GetMapping("/deleteCity")
    public String deleteCity(@RequestParam("id") int id){

    	citiesService.deleteCity(id);

        return "redirect:/admin/cities";
    }
}

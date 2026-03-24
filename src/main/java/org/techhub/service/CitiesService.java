package org.techhub.service;

import java.util.List;

import org.techhub.model.CityModel;

public interface CitiesService {
	
	public List<CityModel> getAllCities();
	public void addCity(CityModel city);
	public void deleteCity(int id);
	
}

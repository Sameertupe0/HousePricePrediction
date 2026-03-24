package org.techhub.repository;

import java.util.List;

import org.techhub.model.CityModel;

public interface CitiesRepo {
	public List<CityModel> getAllCities();
	public void addCity(CityModel city);
	public void deleteCity(int id);
}

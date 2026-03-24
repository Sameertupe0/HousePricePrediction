package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.model.CityModel;
import org.techhub.repository.CitiesRepo;


@Service
public class CitiesServiceImpl implements CitiesService{

	@Autowired
	private CitiesRepo citiesRepo;
	@Override
	public List<CityModel> getAllCities() {
		// TODO Auto-generated method stub
		return citiesRepo.getAllCities();
	}

	@Override
	public void addCity(CityModel city) {
		
		citiesRepo.addCity(city);
	}

	@Override
	public void deleteCity(int id) {
		// TODO Auto-generated method stub
		
		citiesRepo.deleteCity(id);
		
	}

}

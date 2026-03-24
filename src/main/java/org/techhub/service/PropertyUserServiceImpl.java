package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.model.PropertyModelUser;
import org.techhub.repository.PropertyUserRepo;

@Service
public class PropertyUserServiceImpl implements PropertyUserService{

	@Autowired
	PropertyUserRepo propertyUserRepo;
	
	@Override
	public List<PropertyModelUser> searchProperty(String city, String state) {
		// TODO Auto-generated method stub
		return propertyUserRepo.searchProperty(city, state);
	}

}

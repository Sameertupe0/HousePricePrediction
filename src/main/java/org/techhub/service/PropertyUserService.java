package org.techhub.service;

import java.util.List;

import org.techhub.model.PropertyModelUser;

public interface PropertyUserService {

	public List<PropertyModelUser> searchProperty(String city,String state);

	
}

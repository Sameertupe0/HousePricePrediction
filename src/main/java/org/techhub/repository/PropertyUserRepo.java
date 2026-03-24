package org.techhub.repository;

import java.util.List;

import org.techhub.model.PropertyModelUser;

public interface PropertyUserRepo {

	public List<PropertyModelUser> searchProperty(String city,String state);


}

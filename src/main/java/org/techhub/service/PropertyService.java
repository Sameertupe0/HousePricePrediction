package org.techhub.service;

import java.util.List;

import org.techhub.model.PropertyModel;

public interface PropertyService {
	public int addProperty(PropertyModel p);
	public List<PropertyModel> getAllProperties();
	PropertyModel getPropertyById(int id);
    void updateProperty(PropertyModel p);
    void deleteProperty(int id);
}

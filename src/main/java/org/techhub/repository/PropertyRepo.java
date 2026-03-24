package org.techhub.repository;

import java.util.List;

import org.techhub.model.PropertyModel;

public interface PropertyRepo {
	public int addProperty(PropertyModel p);
	public List<PropertyModel> getAllProperties();
	PropertyModel getPropertyById(int id);
    void updateProperty(PropertyModel p);
    void deleteProperty(int id);
}

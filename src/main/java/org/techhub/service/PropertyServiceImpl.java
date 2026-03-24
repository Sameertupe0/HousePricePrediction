package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.model.PropertyModel;
import org.techhub.repository.PropertyRepo;


@Service
public class PropertyServiceImpl implements PropertyService{

	@Autowired
	PropertyRepo propRepo;
	@Override
	public int addProperty(PropertyModel p) {
		// TODO Auto-generated method stub
		return propRepo.addProperty(p);
	}

	@Override
	public List<PropertyModel> getAllProperties() {
		// TODO Auto-generated method stub
		return propRepo.getAllProperties();
	}

	@Override
	public PropertyModel getPropertyById(int id) {
		// TODO Auto-generated method stub
		return propRepo.getPropertyById(id);
	}

	@Override
	public void updateProperty(PropertyModel p) {
		// TODO Auto-generated method stub
		propRepo.updateProperty(p);
	}

	@Override
	public void deleteProperty(int id) {
		// TODO Auto-generated method stub
		propRepo.deleteProperty(id);
	}

}

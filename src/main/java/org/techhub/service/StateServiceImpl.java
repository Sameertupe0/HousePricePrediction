package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.model.StateModel;
import org.techhub.repository.StateRepo;

@Service
public class StateServiceImpl implements StateService{
	
	@Autowired
	private StateRepo stateRepo;

	@Override
	public List<StateModel> getAllStates() {
		// TODO Auto-generated method stub
		return stateRepo.getAllStates();
	}

	@Override
	public void addState(String name) {
		// TODO Auto-generated method stub
		stateRepo.addState(name);
	}

	@Override
	public void deleteState(int id) {
		stateRepo.deleteState(id);
	}
	
	
	
	
}

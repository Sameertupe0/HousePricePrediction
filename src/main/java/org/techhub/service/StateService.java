package org.techhub.service;

import java.util.List;

import org.techhub.model.StateModel;

public interface StateService {
	
	public List<StateModel> getAllStates();
	public void addState(String name);
	public void deleteState(int id);
}

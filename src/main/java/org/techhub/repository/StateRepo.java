package org.techhub.repository;

import java.util.List;

import org.techhub.model.StateModel;

public interface StateRepo {
	public List<StateModel> getAllStates();
	public void addState(String name);
	public void deleteState(int id);
}

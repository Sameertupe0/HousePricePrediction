package org.techhub.repository;

import java.util.List;

import org.techhub.model.UserModel;

public interface AdminRepo {
	public List<UserModel> getAllUsers();
	public void deleteUser(int id);
	public void blockUser(int id);
	public void activateUser(int id);
}

package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.model.UserModel;
import org.techhub.repository.AdminRepo;

@Service
public interface AdminService {
	
	public List<UserModel> getAllUsers();
	public void deleteUser(int id);
	public void blockUser(int id);
	public void activateUser(int id);
}

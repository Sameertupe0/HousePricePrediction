package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.techhub.model.UserModel;
import org.techhub.repository.AdminRepo;


@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminRepo adminRepo;
	@Override
	public List<UserModel> getAllUsers() {
		// TODO Auto-generated method stub
		return adminRepo.getAllUsers();
	}
	@Override
	public void deleteUser(int id) {
		
		adminRepo.deleteUser(id);
		
	}
	@Override
	public void blockUser(int id) {
	
		adminRepo.blockUser(id);
		
	}
	@Override
	public void activateUser(int id) {
		
		adminRepo.activateUser(id);
		
	}
	
	

}

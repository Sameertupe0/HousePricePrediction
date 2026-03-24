package org.techhub.service;

import org.techhub.model.UserModel;

public interface UserService {
	void registerUser(UserModel model);

	UserModel findByEmail(String email);
	UserModel loginUser(String email,String password);
}
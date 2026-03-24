package org.techhub.repository;



import org.techhub.model.UserModel;

public interface UserRepo {

    void registerUser(UserModel model);

    UserModel findByEmail(String email);

}
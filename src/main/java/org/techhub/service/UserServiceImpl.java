package org.techhub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.techhub.model.UserModel;
import org.techhub.repository.UserRepo;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepo userRepo;

    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    @Override
    public void registerUser(UserModel model) {

        // Encrypt password
        String encryptedPassword = encoder.encode(model.getPassword());

        model.setPassword(encryptedPassword);

        userRepo.registerUser(model);
    }

    @Override
    public UserModel loginUser(String email, String password) {

        UserModel user = userRepo.findByEmail(email);

        if (user != null && encoder.matches(password, user.getPassword())) {
            return user;
        }

        return null;
    }

    @Override
    public UserModel findByEmail(String email) {

        return userRepo.findByEmail(email);
    }
}
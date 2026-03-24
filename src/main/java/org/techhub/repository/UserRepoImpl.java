package org.techhub.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.techhub.model.UserModel;

@Repository
public class UserRepoImpl implements UserRepo {

@Autowired
JdbcTemplate jdbcTemplate;

@Override
public void registerUser(UserModel model){

String sql =
"insert into users(name,email,password,role) values(?,?,?,?)";

jdbcTemplate.update(sql,
model.getName(),
model.getEmail(),
model.getPassword(),
model.getRole());

}

@Override
public UserModel findByEmail(String email) {


    String sql = "select * from users where email=?";

    try {

        return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {

            UserModel user = new UserModel();

            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role"));

            return user;

        }, email);

    } catch (Exception e) {

        return null;
    }

}

}
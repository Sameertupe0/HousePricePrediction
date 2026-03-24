package org.techhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.techhub.model.UserModel;





@Repository
public class AdminRepoImpl implements AdminRepo{

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	@Override
	public List<UserModel> getAllUsers() {
		List<UserModel> list = jdbcTemplate.query("select *from users", new RowMapper<UserModel>() {
			

			@Override
			public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserModel user = new UserModel();
				 user.setId(rs.getInt("id"));
			        user.setName(rs.getString("name"));
			        user.setEmail(rs.getString("email"));
			        user.setPassword(rs.getString("password"));
			        user.setStatus(rs.getString("status"));
			        
			        	
			    	return user;
			}
			
		});
	
		return list;
	}


	@Override
	public void deleteUser(int id) {
		String sql = "delete from users where id=?";
		jdbcTemplate.update(sql,id);
		
	}


	@Override
	public void blockUser(int id) {
		String sql = "Update users set status='BLOCKED' WHERE id=?";
		jdbcTemplate.update(sql,id);
		
	}


	@Override
	public void activateUser(int id) {
		String sql = "Update users set status='ACTIVE' WHERE id=?";
		jdbcTemplate.update(sql,id);
		
	}

}

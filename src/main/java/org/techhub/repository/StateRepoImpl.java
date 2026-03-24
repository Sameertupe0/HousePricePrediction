package org.techhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.techhub.model.StateModel;
import org.techhub.model.UserModel;

@Repository
public class StateRepoImpl implements StateRepo{

	@Autowired 
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<StateModel> getAllStates() {
		List<StateModel> list = jdbcTemplate.query("select *from states", new RowMapper<StateModel>() {

			@Override
			public StateModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				StateModel state = new StateModel();
				state.setId(rs.getInt("id"));
				state.setName(rs.getString("name"));
			
				return state;
			}

		});

		return list;
	}

	@Override
	public void addState(String name) {
		String sql = "insert into states(name) values(?)";
		
		jdbcTemplate.update(sql,name);
		
	}

	@Override
	public void deleteState(int id) {
		String sql = "delete from states where id=?";
		
		jdbcTemplate.update(sql,id);
		
	}
	
	

}

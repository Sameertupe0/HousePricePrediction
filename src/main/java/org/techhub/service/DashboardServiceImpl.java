package org.techhub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.techhub.repository.PropertyRepo;
import org.techhub.repository.UserRepo;


@Service
public class DashboardServiceImpl implements DashboardService{

	
	
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int getTotalUsers() {
		String sql = "select count(*) from users";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	@Override
	public int getTotalProperties() {
		String sql = "select count(*) from properties";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}


	

}

package org.techhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.techhub.model.PropertyModelUser;


@Repository
public class PropertyUserRepoImpl implements PropertyUserRepo{
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<PropertyModelUser> searchProperty(String city, String state) {
		
		 String sql = "SELECT p.id, p.title, p.price, c.name AS city_name, s.name AS state_name " +
                 "FROM properties p " +
                 "JOIN cities c ON p.city_id = c.id " +
                 "JOIN states s ON c.state_id = s.id " +
                 "WHERE c.name = ? AND s.name = ?";
		 
		 return jdbcTemplate.query(sql, new Object[]{city, state}, (rs, rowNum) -> {
			    
			    PropertyModelUser p = new PropertyModelUser();

			    p.setId(rs.getInt("id"));
			    p.setTitle(rs.getString("title"));
			    p.setPrice(rs.getDouble("price"));

			    // using alias
			    p.setCity(rs.getString("city_name"));
			    p.setState(rs.getString("state_name"));

			    return p;
			});
		
		
	}

}

package org.techhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.techhub.model.CityModel;
import org.techhub.model.UserModel;


@Repository
public class CitiesRepoImpl implements CitiesRepo{

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<CityModel> getAllCities() {
		List<CityModel> list = jdbcTemplate.query("select *from cities", new RowMapper<CityModel>() {

			@Override
			public CityModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				CityModel city= new CityModel();
				city.setId(rs.getInt("id"));
				city.setName(rs.getString("name"));
				city.setState_id(rs.getInt("state_id"));
				city.setLatitude(rs.getDouble("latitude"));
			    city.setLongitude(rs.getDouble("longitude"));
			    city.setLocation(rs.getString("location"));

				return city;
			}

		});

		return list;
	}

	@Override
	public void addCity(CityModel city) {
		  String sql="INSERT INTO cities(name,state_id,latitude,longitude,location) VALUES(?,?,?,?,?)";

	        jdbcTemplate.update(sql,
	                city.getName(),
	                city.getState_id(),
	                city.getLatitude(),
	                city.getLongitude(),
	                city.getLocation());
		
	}

	@Override
	public void deleteCity(int id) {
		 String sql="DELETE FROM cities WHERE id=?";

	        jdbcTemplate.update(sql,id);
		
	}

}

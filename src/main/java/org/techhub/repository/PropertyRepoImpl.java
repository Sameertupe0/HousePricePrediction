package org.techhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.techhub.model.PropertyModel;

@Repository
public class PropertyRepoImpl implements PropertyRepo{

	@Autowired
	JdbcTemplate template;
	@Override
	public int addProperty(PropertyModel p) {
		String sql="insert into properties(title,price,bedrooms,bathrooms,area,property_type,city_id,location,latitude,longitude) values(?,?,?,?,?,?,?,?,?,?)";

		return template.update(sql,
		p.getTitle(),
		p.getPrice(),
		p.getBedrooms(),
		p.getBathrooms(),
		p.getArea(),
		p.getProperty_type(),
		p.getCity_id(),
		p.getLocation(),
		p.getLatitude(),
		p.getLongitude());
	}

	@Override
	public List<PropertyModel> getAllProperties() {
		String sql="select * from properties";

		return template.query(sql,(rs,rowNum)->{

		PropertyModel p = new PropertyModel();

		p.setId(rs.getInt("id"));
		p.setTitle(rs.getString("title"));
		p.setPrice(rs.getDouble("price"));
		p.setBedrooms(rs.getInt("bedrooms"));
		p.setBathrooms(rs.getInt("bathrooms"));
		p.setArea(rs.getDouble("area"));
		p.setProperty_type(rs.getString("property_type"));
		p.setCity_id(rs.getInt("city_id"));
		p.setLocation(rs.getString("location"));
		p.setLatitude(rs.getDouble("latitude"));
		p.setLongitude(rs.getDouble("longitude"));

		return p;

		});
	}

	@Override
	public PropertyModel getPropertyById(int id) {
		// TODO Auto-generated method stub
		return template.queryForObject(
		        "SELECT * FROM properties WHERE id = ?",
		        new BeanPropertyRowMapper<>(PropertyModel.class),
		        id
		    );
	}

	@Override
	public void updateProperty(PropertyModel p) {
		 template.update(
			        "UPDATE properties SET title=?, price=?, bedrooms=?, bathrooms=?, area=?, property_type=?, city_id=?, location=?, latitude=?, longitude=? WHERE id=?",
			        p.getTitle(), p.getPrice(), p.getBedrooms(), p.getBathrooms(), p.getArea(),
			        p.getProperty_type(), p.getCity_id(), p.getLocation(), p.getLatitude(), p.getLongitude(), p.getId()
			    );
		
	}

	@Override
	public void deleteProperty(int id) {
		template.update("DELETE FROM properties WHERE id=?", id);
		
	}

}

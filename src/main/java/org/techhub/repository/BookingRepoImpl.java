package org.techhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.techhub.model.Booking;

@Repository
public class BookingRepoImpl implements BookingRepo{

	@Autowired
	JdbcTemplate jdbcTemplate;
	@Override
	public int saveBooking(int userId, int propertyId) {
		
		String sql = "Insert into booking(user_id,property_id,date) values(?,?,NOW())";
		
		return jdbcTemplate.update(sql,userId,propertyId);
		
	}

	@Override
	public List<Booking> getBookings(int userId) {
		  String sql = "SELECT b.*, p.title, c.name AS city, p.price " +
		             "FROM booking b " +
		             "JOIN properties p ON b.property_id = p.id " +
		             "JOIN cities c ON p.city_id = c.id " +
		             "WHERE b.user_id = ?";
		  return jdbcTemplate.query(sql, new Object[]{userId}, new RowMapper<Booking>() {

	            @Override
	            public Booking mapRow(ResultSet rs, int rowNum) throws SQLException {

	                Booking b = new Booking();

	                b.setId(rs.getInt("id"));
	                b.setUserId(rs.getInt("user_id"));
	                b.setPropertyId(rs.getInt("property_id"));
	                b.setDate(rs.getTimestamp("date"));

	                b.setTitle(rs.getString("title"));
	                b.setCity(rs.getString("city"));
	                b.setPrice(rs.getInt("price"));

	                return b;
	            }
	        });
	}

}

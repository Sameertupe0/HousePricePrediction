package org.techhub.repository;

import java.util.List;

import org.techhub.model.Booking;

public interface BookingRepo {
	
	public int saveBooking(int userId,int propertyId);
	
	public List<Booking> getBookings(int userId);

}

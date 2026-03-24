package org.techhub.service;

import java.util.List;

import org.techhub.model.Booking;

public interface BookingService {
	public int saveBooking(int userId,int propertyId);
	
	public List<Booking> getBookings(int userId);
}

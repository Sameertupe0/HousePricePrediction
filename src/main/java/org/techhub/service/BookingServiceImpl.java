package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.model.Booking;
import org.techhub.repository.BookingRepo;

@Service
public class BookingServiceImpl implements BookingService{

	@Autowired
	BookingRepo bookingRepo;
	
	@Override
	public int saveBooking(int userId, int propertyId) {
		// TODO Auto-generated method stub
		return bookingRepo.saveBooking(userId, propertyId);
	}

	@Override
	public List<Booking> getBookings(int userId) {
		// TODO Auto-generated method stub
		return bookingRepo.getBookings(userId);
	}

}

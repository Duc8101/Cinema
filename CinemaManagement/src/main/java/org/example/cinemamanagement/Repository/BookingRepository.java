package org.example.cinemamanagement.Repository;

import org.example.cinemamanagement.Entity.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends CrudRepository<Booking, Integer>, JpaRepository<Booking, Integer> {
}

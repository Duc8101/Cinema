package org.example.cinemamanagement.Repository;

import org.example.cinemamanagement.Entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomRepository extends CrudRepository<Room, Integer>, JpaRepository<Room, Integer> {
}

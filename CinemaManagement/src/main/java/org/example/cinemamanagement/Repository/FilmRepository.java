package org.example.cinemamanagement.Repository;

import org.example.cinemamanagement.Entity.Film;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FilmRepository extends CrudRepository<Film,Integer>, JpaRepository<Film,Integer> {
}

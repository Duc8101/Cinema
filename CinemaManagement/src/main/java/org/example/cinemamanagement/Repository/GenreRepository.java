package org.example.cinemamanagement.Repository;

import org.example.cinemamanagement.Entity.Genre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GenreRepository extends CrudRepository<Genre, Integer>, JpaRepository<Genre, Integer> {
}

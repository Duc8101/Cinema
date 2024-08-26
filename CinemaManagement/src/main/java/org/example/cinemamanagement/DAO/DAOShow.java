/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.example.cinemamanagement.DAO;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Stream;
import org.example.cinemamanagement.Entity.Show;
import org.example.cinemamanagement.Repository.ShowRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DAOShow {

    @Autowired
    private ShowRepository showRepo;

    private Stream<Show> getStream(Integer RoomID, Integer FilmID, String date) throws ParseException {
        Stream<Show> stream = showRepo.findAll().stream();
        java.sql.Date sqlDate;
        if (RoomID != null) {
            stream = stream.filter(s -> s.getRoom().getRoomId() == RoomID);
        }

        if (FilmID != null) {
            stream = stream.filter(s -> s.getFilm().getFilmId() == FilmID);
        }
        if (date == null || date.trim().isEmpty()) {
            sqlDate = null;
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dateFor = sdf.parse(date);
            sqlDate = new java.sql.Date(dateFor.getTime());
            stream = stream.filter(s -> s.getShowDate().equals(sqlDate));
        }
        return stream;
    }

    public List<Show> getListShow(Integer RoomID, Integer FilmID, String date) throws ParseException {
        Stream<Show> stream = this.getStream(RoomID, FilmID, date);
        return stream.toList();
    }

}

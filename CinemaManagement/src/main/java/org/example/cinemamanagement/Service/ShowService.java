package org.example.cinemamanagement.Service;

import org.example.cinemamanagement.Entity.Film;
import org.example.cinemamanagement.Entity.Room;
import org.example.cinemamanagement.Entity.Show;
import org.example.cinemamanagement.Repository.FilmRepository;
import org.example.cinemamanagement.Repository.RoomRepository;
import org.example.cinemamanagement.Repository.ShowRepository;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
@Service
public class ShowService {
    private final ShowRepository showRepo;
    private final RoomRepository roomRepo;
    private final FilmRepository filmRepo;

    public ShowService(ShowRepository showRepo, RoomRepository roomRepo, FilmRepository filmRepo) {
        this.showRepo = showRepo;
        this.roomRepo = roomRepo;
        this.filmRepo = filmRepo;
    }

    public Map<String, Object> List(Integer RoomID, Integer FilmID, String date) throws ParseException {
        List<Show> listShow = showRepo.findAll();
        java.sql.Date sqlDate;
        if (RoomID != null) {
            listShow = listShow.stream().filter(s -> s.getRoom().getRoomId() == RoomID).toList();
        }

        if (FilmID != null) {
            listShow = listShow.stream().filter(s -> s.getFilm().getFilmId() == FilmID).toList();
        }

        if (date == null || date.trim().isEmpty()) {
            sqlDate = null;
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dateFor = sdf.parse(date);
            sqlDate = new java.sql.Date(dateFor.getTime());
            listShow = listShow.stream().filter(s -> s.getShowDate().equals(sqlDate)).toList();
        }
        List<Room> listRoom = roomRepo.findAll();
        List<Film> listFilm = filmRepo.findAll();
        Map<String, Object> map = new HashMap<>();
        map.put("shows", listShow);
        map.put("rooms", listRoom);
        map.put("films", listFilm);
        map.put("RoomID", RoomID);
        map.put("FilmID", FilmID);
        map.put("date", sqlDate);
        return map;
    }

    public Map<String, Object> Detail(int ShowID){
        Map<String, Object> map = new HashMap<>();
        Optional<Show> option = showRepo.findById(ShowID);
        option.ifPresent(show -> map.put("show", show));
        return map;
    }
}

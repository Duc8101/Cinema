package org.example.cinemamanagement.Service;

import org.example.cinemamanagement.DTO.ShowDTO.ShowCreateDTO;
import org.example.cinemamanagement.DTO.ShowDTO.ShowUpdateDTO;
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

    public Map<String, Object> Detail(int ShowID) {
        Map<String, Object> map = new HashMap<>();
        Optional<Show> option = showRepo.findById(ShowID);
        option.ifPresent(show -> map.put("show", show));
        return map;
    }

    public Map<String, Object> Create() {
        List<Room> listRoom = roomRepo.findAll();
        List<Film> listFilm = filmRepo.findAll();
        List<Integer> slots = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9);
        Map<String, Object> map = new HashMap<>();
        map.put("rooms", listRoom);
        map.put("films", listFilm);
        map.put("slots", slots);
        return map;
    }

    public Map<String, Object> Create(ShowCreateDTO DTO) throws ParseException {
        Map<String, Object> map = Create();
        java.sql.Date sqlDate;
        if (DTO.getShowDate() == null || DTO.getShowDate().trim().isEmpty()) {
            // Get the current date in milliseconds
            long millis = System.currentTimeMillis();
            // Convert milliseconds to a java.util.Date object
            Date today = new Date(millis);
            // Convert java.util.Date to a java.sql.Date object (only date part)
            sqlDate = java.sql.Date.valueOf(today.toString());
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = sdf.parse(DTO.getShowDate());
            sqlDate = new java.sql.Date(date.getTime());
        }
        List<Show> listShow = showRepo.findAll().stream().filter(s -> s.getRoom().getRoomId() == DTO.getRoomID() && s.getShowDate().equals(sqlDate) && s.getSlot() == DTO.getSlot()).toList();
        if (listShow.isEmpty()) {
            Optional<Room> room = roomRepo.findById(DTO.getRoomID());
            if (room.isEmpty()) {
                map.put("error", "Not found room");
                return map;
            }
            Optional<Film> film = filmRepo.findById(DTO.getFilmID());
            if (film.isEmpty()) {
                map.put("error", "Not found film");
                return map;
            }
            Show show = new Show();
            show.setStatus(false);
            show.setShowDate(sqlDate);
            show.setRoom(room.get());
            show.setFilm(film.get());
            show.setPrice(DTO.getPrice());
            show.setSlot(DTO.getSlot());
            showRepo.save(show);
            map.put("success", "Create successful");
            return map;
        }
        map.put("error", "Show with Room '" + listShow.get(0).getRoom().getName() + "', date " + listShow.get(0).getShowDate() + " and slot " + listShow.get(0).getSlot() + " existed");
        return map;
    }

    private void setData(Map<String, Object> map, Show show) {
        List<Film> listFilm = filmRepo.findAll();
        List<Integer> allSlots = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9);
        List<Show> listShow = showRepo.findAll().stream().filter(
                s -> s.getRoom().getRoomId() == show.getRoom().getRoomId()
                        && s.getShowDate().equals(show.getShowDate())
                        && s.getSlot() != show.getSlot()
        ).toList();
        List<Integer> listSlot = new ArrayList<>();
        for (Show item : listShow) {
            listSlot.add(item.getSlot());
        }
        List<Integer> slots = new ArrayList<>();
        for (int slot : allSlots) {
            if (!listSlot.contains(slot)) {
                slots.add(slot);
            }
        }
        map.put("films", listFilm);
        map.put("slots", slots);
        map.put("show", show);
    }

    public Map<String, Object> Update(int ShowID) {
        Map<String, Object> map = new HashMap<>();
        Optional<Show> option = showRepo.findById(ShowID);
        if (option.isEmpty()) {
            return null;
        }
        Show show = option.get();
        setData(map, show);
        return map;
    }

    public Map<String, Object> Update(int ShowID, ShowUpdateDTO DTO) {
        Optional<Film> optionFilm = filmRepo.findById(DTO.getFilmID());
        if (optionFilm.isEmpty()) {
            return null;
        }
        Optional<Show> optionShow = showRepo.findById(ShowID);
        if (optionShow.isEmpty()) {
            return null;
        }
        Map<String, Object> map = new HashMap<>();
        Show show = optionShow.get();
        Film film = optionFilm.get();
        show.setFilm(film);
        show.setPrice(DTO.getPrice());
        show.setSlot(DTO.getSlot());
        showRepo.save(show);
        setData(map, show);
        map.put("success", "Update successful");
        return map;
    }

    public boolean Delete(int ShowID) {
        Optional<Show> option = showRepo.findById(ShowID);
        if (option.isEmpty()) {
            return false;
        }
        Show show = option.get();
        showRepo.delete(show);
        return true;
    }
}

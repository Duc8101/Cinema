package org.example.cinemamanagement.Entity;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "shows")
public class Show {
    public Show() {
        bookings = new ArrayList<>();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "show_id", nullable = false)
    private int showId;

    @Column(name = "room_id", nullable = false)
    private int roomId;

    @Column(name = "film_id", nullable = false)
    private int filmId;

    @Column(name = "show_date")
    private Date showDate;

    @Column(name = "price", nullable = false)
    private double price;

    @Column(name = "status", nullable = false)
    private boolean status;

    @Column(name = "slot", nullable = false)
    private int slot;

    @ManyToOne
    private Film film;

    @ManyToOne
    private Room room;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Booking> bookings;

    public Show(int roomId, int filmId, Date showDate, double price, boolean status, int slot) {
        this.roomId = roomId;
        this.filmId = filmId;
        this.showDate = showDate;
        this.price = price;
        this.status = status;
        this.slot = slot;
    }

    public int getShowId() {
        return showId;
    }

    public void setShowId(int showId) {
        this.showId = showId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getFilmId() {
        return filmId;
    }

    public void setFilmId(int filmId) {
        this.filmId = filmId;
    }

    public Date getShowDate() {
        return showDate;
    }

    public void setShowDate(Date showDate) {
        this.showDate = showDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public Film getFilm() {
        return film;
    }

    public void setFilm(Film film) {
        this.film = film;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public List<Booking> getBookings() {
        return bookings;
    }

    public void setBookings(List<Booking> bookings) {
        this.bookings = bookings;
    }
}

package org.example.cinemamanagement.Entity;

import jakarta.persistence.*;
import org.springframework.lang.NonNull;

import java.util.ArrayList;
import java.sql.Date;
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

    @Column(name = "show_date")
    private Date showDate;

    @Column(name = "price", nullable = false)
    @NonNull
    private double price;

    @Column(name = "status", nullable = false)
    @NonNull
    private boolean status;

    @Column(name = "slot", nullable = false)
    @NonNull
    private int slot;

    @ManyToOne
    @JoinColumn(name = "film_id")
    private Film film;

    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "show")
    private List<Booking> bookings;

    public int getShowId() {
        return showId;
    }

    public void setShowId(int showId) {
        this.showId = showId;
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

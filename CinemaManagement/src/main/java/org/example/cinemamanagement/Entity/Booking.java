package org.example.cinemamanagement.Entity;

import jakarta.persistence.*;
import org.example.cinemamanagement.Const.BookingConst;
import org.springframework.lang.NonNull;

import java.math.BigDecimal;

@Entity
@Table(name = "bookings")
public class Booking {
    public Booking() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "booking_id", nullable = false)
    private int bookingId;

    @Column(name = "name", nullable = false, length = BookingConst.MAX_LENGTH_NAME)
    private String name;

    @Column(name = "seat_status", nullable = false, length = BookingConst.MAX_LENGTH_SEAT_STATUS)
    private String seatStatus;

    @Column(name = "amount", nullable = false)
    @NonNull
    private double amount;

    @ManyToOne
    @JoinColumn(name = "show_id")
    @NonNull
    private Show show;

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    @NonNull
    public String getName() {
        return name;
    }

    public void setName(@NonNull String name) {
        this.name = name;
    }

    @NonNull
    public String getSeatStatus() {
        return seatStatus;
    }

    public void setSeatStatus(@NonNull String seatStatus) {
        this.seatStatus = seatStatus;
    }

    @NonNull
    public double getAmount() {
        return amount;
    }

    public void setAmount(@NonNull double amount) {
        this.amount = amount;
    }

    @NonNull
    public Show getShow() {
        return show;
    }

    public void setShow(@NonNull Show show) {
        this.show = show;
    }
}

package org.example.cinemamanagement.Entity;

import jakarta.persistence.*;
import org.example.cinemamanagement.Const.RoomConst;
import org.springframework.lang.NonNull;

import java.util.*;

@Entity
@Table(name = "rooms")
public class Room {
    public Room() {
        shows = new ArrayList<>();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "room_id", nullable = false)
    private int roomId;

    @Column(name = "name", nullable = false, length = RoomConst.MAX_LENGTH_NAME)
    @NonNull
    private String name;

    @Column(name = "number_rows", nullable = false)
    private int numberRows;

    @Column(name = "number_cols", nullable = false)
    private int numberCols;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Show> shows;

    public Room(@NonNull String name, int numberRows, int numberCols) {
        this.name = name;
        this.numberRows = numberRows;
        this.numberCols = numberCols;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    @NonNull
    public String getName() {
        return name;
    }

    public void setName(@NonNull String name) {
        this.name = name;
    }

    public int getNumberRows() {
        return numberRows;
    }

    public void setNumberRows(int numberRows) {
        this.numberRows = numberRows;
    }

    public int getNumberCols() {
        return numberCols;
    }

    public void setNumberCols(int numberCols) {
        this.numberCols = numberCols;
    }

    public List<Show> getShows() {
        return shows;
    }

    public void setShows(List<Show> shows) {
        this.shows = shows;
    }
}

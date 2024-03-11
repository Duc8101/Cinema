package org.example.cinemamanagement.DTO.ShowDTO;

public class ShowCreateDTO {
    private String ShowDate;
    private double price;
    private int slot;
    private int RoomID;
    private int FilmID;

    public String getShowDate() {
        return ShowDate;
    }

    public void setShowDate(String showDate) {
        ShowDate = showDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public int getRoomID() {
        return RoomID;
    }

    public void setRoomID(int roomID) {
        RoomID = roomID;
    }

    public int getFilmID() {
        return FilmID;
    }

    public void setFilmID(int filmID) {
        FilmID = filmID;
    }
}

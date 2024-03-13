package org.example.cinemamanagement.DTO.ShowDTO;

public class ShowUpdateDTO {
    private double price;
    private int slot;
    private int FilmID;

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

    public int getFilmID() {
        return FilmID;
    }

    public void setFilmID(int filmID) {
        FilmID = filmID;
    }
}

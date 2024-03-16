package org.example.cinemamanagement.DTO.BookingDTO;

import java.util.ArrayList;
import java.util.List;

public class BookingCreateUpdateDTO {
    private String name;
    private double amount;
    private int ShowID;

    public String getName() {
        return name;
    }

    public double getAmount() {
        return amount;
    }

    public int getShowID() {
        return ShowID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public void setShowID(int showID) {
        ShowID = showID;
    }

}

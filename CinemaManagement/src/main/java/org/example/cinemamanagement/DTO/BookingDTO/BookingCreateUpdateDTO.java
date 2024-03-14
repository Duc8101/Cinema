package org.example.cinemamanagement.DTO.BookingDTO;

import java.util.List;

public class BookingCreateUpdateDTO {
    private String name;
    private double amount;
    private int ShowID;
    private List<Integer> check;

    public String getName() {
        return name;
    }

    public double getAmount() {
        return amount;
    }

    public int getShowID() {
        return ShowID;
    }

    public List<Integer> getCheck() {
        return check;
    }
}

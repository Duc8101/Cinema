package org.example.cinemamanagement.DTO.ShowDTO;

public class ShowCreateDTO extends ShowUpdateDTO{
    private String ShowDate;
    private int RoomID;

    public String getShowDate() {
        return ShowDate;
    }

    public void setShowDate(String showDate) {
        ShowDate = showDate;
    }

    public int getRoomID() {
        return RoomID;
    }

    public void setRoomID(int roomID) {
        RoomID = roomID;
    }
}

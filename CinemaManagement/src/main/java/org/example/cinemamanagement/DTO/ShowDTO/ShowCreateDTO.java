package org.example.cinemamanagement.DTO.ShowDTO;

public class ShowCreateDTO extends ShowUpdateDTO{
    private String ShowDate;
    private int RoomID;

    public String getShowDate() {
        return ShowDate;
    }

    public int getRoomID() {
        return RoomID;
    }

    public void setShowDate(String showDate) {
        ShowDate = showDate;
    }

    public void setRoomID(int roomID) {
        RoomID = roomID;
    }
}

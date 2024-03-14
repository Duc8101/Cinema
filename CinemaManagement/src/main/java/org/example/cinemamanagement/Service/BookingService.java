package org.example.cinemamanagement.Service;

import org.example.cinemamanagement.Entity.Booking;
import org.example.cinemamanagement.Entity.Show;
import org.example.cinemamanagement.Repository.BookingRepository;
import org.example.cinemamanagement.Repository.ShowRepository;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class BookingService {
    private final ShowRepository showRepo;
    private final BookingRepository bookRepo;

    public BookingService(ShowRepository showRepo, BookingRepository bookRepo) {
        this.showRepo = showRepo;
        this.bookRepo = bookRepo;
    }

    private List<Integer> getListRow(int numberRow) {
        List<Integer> rows = new ArrayList<>();
        for (int i = 1; i <= numberRow; i++) {
            rows.add(i);
        }
        return rows;
    }

    private List<Integer> getListCol(int numberCol) {
        List<Integer> cols = new ArrayList<>();
        for (int j = 1; j <= numberCol; j++) {
            cols.add(j);
        }
        return cols;
    }

    public Map<String, Object> List(int ShowID) {
        Map<String, Object> map = new HashMap<>();
        Optional<Show> option = showRepo.findById(ShowID);
        if (option.isEmpty()) {
            return null;
        }
        Show show = option.get();
        int row = show.getRoom().getNumberRows();
        int col = show.getRoom().getNumberCols();
        // set all seat not booked
        String seatStatus = String.valueOf('0').repeat(row * col);
        char[] seats = seatStatus.toCharArray();
        for (Booking book : show.getBookings()) {
            for (int i = 0; i < book.getSeatStatus().length(); i++) {
                if (book.getSeatStatus().charAt(i) == '1') {
                    seats[i] = '1';
                }
            }
        }
        // create list row
        List<Integer> rows = getListRow(row);
        // create list col
        List<Integer> cols = getListCol(col);
        Map<Integer, Boolean> dataSeat = new HashMap<>();
        for (int i = 1; i <= row; i++) {
            for (int j = 1; j <= col; j++) {
                int index = row * (i - 1) + j - 1;
                dataSeat.put(index, seats[index] == '1');
            }
        }
        map.put("listBooking", show.getBookings());
        map.put("rows", rows);
        map.put("cols", cols);
        map.put("data", dataSeat);
        map.put("numberRow", row);
        map.put("numberCol", col);
        return map;
    }

    public Map<String, Object> Detail(int BookingID) {
        Map<String, Object> map = new HashMap<>();
        Optional<Booking> option = bookRepo.findById(BookingID);
        if (option.isEmpty()) {
            return null;
        }
        Booking book = option.get();
        int row = book.getShow().getRoom().getNumberRows();
        int col = book.getShow().getRoom().getNumberCols();
        // set all seat not booked
        String seatStatus = String.valueOf('0').repeat(row * col);
        char[] seats = seatStatus.toCharArray();
        for (int i = 0; i < book.getSeatStatus().length(); i++) {
            if (book.getSeatStatus().charAt(i) == '1') {
                seats[i] = '1';
            }
        }
        // create list row
        List<Integer> rows = getListRow(row);
        // create list col
        List<Integer> cols = getListCol(col);
        Map<Integer, Boolean> dataSeat = new HashMap<>();
        for (int i = 1; i <= row; i++) {
            for (int j = 1; j <= col; j++) {
                int index = row * (i - 1) + j - 1;
                dataSeat.put(index, seats[index] == '1');
            }
        }
        map.put("booking", book);
        map.put("rows", rows);
        map.put("cols", cols);
        map.put("data", dataSeat);
        map.put("numberRow", row);
        map.put("numberCol", col);
        return map;
    }
}

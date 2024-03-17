package org.example.cinemamanagement.Service;

import org.example.cinemamanagement.DTO.BookingDTO.BookingCreateUpdateDTO;
import org.example.cinemamanagement.Entity.Booking;
import org.example.cinemamanagement.Entity.Show;
import org.example.cinemamanagement.Repository.BookingRepository;
import org.example.cinemamanagement.Repository.ShowRepository;
import org.springframework.lang.Nullable;
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

    @Nullable
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
        setDataSeat(map, show, row, col, rows, cols, seats);
        return map;
    }

    @Nullable
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

    @Nullable
    public Map<String, Object> Create(int ShowID) {
        return List(ShowID);
    }

    @Nullable
    public Map<String, Object> Create(BookingCreateUpdateDTO DTO, List<Integer> seats) {
        Map<String,Object> map = Create(DTO.getShowID());
        if(map == null){
            return null;
        }
        Show show = (Show) map.get("show");
        int row = show.getRoom().getNumberRows();
        int col = show.getRoom().getNumberCols();
        // check booking exist
        boolean check = bookRepo.findAll().stream().anyMatch(b -> b.getName().equalsIgnoreCase(DTO.getName().trim())
                && b.getShow().getShowId() == DTO.getShowID());
        // if exist booking
        if (check) {
            map.put("error", "Book with name '" + DTO.getName().trim() + "' existed");
            return map;
        }
        // set all seat not booked
        String seatStatus = String.valueOf('0').repeat(row * col);
        char[] seatCreate = seatStatus.toCharArray();
        for(Integer item : seats){
            seatCreate[item] = '1';
        }
        Booking book = new Booking();
        book.setName(DTO.getName().trim());
        book.setAmount(DTO.getAmount());
        book.setShow(show);
        book.setSeatStatus(String.valueOf(seatCreate));
        bookRepo.save(book);
        map.remove("listBooking");
        map.remove("data");
        // get list booking after create
        List<Booking> list = bookRepo.findAll().stream().filter(b -> b.getShow().getShowId() == DTO.getShowID()).toList();
        map.put("listBooking", list);
        // set all seat
        char[] allSeats = seatStatus.toCharArray();
        for (Booking item : list) {
            for (int i = 0; i < item.getSeatStatus().length(); i++) {
                if (item.getSeatStatus().charAt(i) == '1') {
                    allSeats[i] = '1';
                }
            }
        }
        Map<Integer, Boolean> dataSeat = new HashMap<>();
        for (int i = 1; i <= row; i++) {
            for (int j = 1; j <= col; j++) {
                int index = row * (i - 1) + j - 1;
                dataSeat.put(index, allSeats[index] == '1');
            }
        }
        map.put("data", dataSeat);
        map.put("success", "Create successful");
        return map;
    }

    private void setDataSeat(Map<String, Object> map, Show show, int row, int col, List<Integer> rows, List<Integer> cols, char[] seats) {
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
        map.put("show", show);
    }

    @Nullable
    public Map<String, Object> Update(int BookingID){
        Map<String, Object> map = new HashMap<>();
        Optional<Booking> option = bookRepo.findById(BookingID);
        if (option.isEmpty()) {
            return null;
        }
        Booking book = option.get();
        List<Booking> list = bookRepo.findAll().stream().filter(b -> b.getShow().getShowId() == book.getShow().getShowId()).toList();
        int row = book.getShow().getRoom().getNumberRows();
        int col = book.getShow().getRoom().getNumberCols();
        // set all seat not booked
        String seatStatus = String.valueOf('0').repeat(row * col);
        char[] allSeats = seatStatus.toCharArray();
        for (Booking item : list) {
            for (int i = 0; i < item.getSeatStatus().length(); i++) {
                if (item.getSeatStatus().charAt(i) == '1') {
                    allSeats[i] = '1';
                }
            }
        }
        char[] bookSeat = book.getSeatStatus().toCharArray();
        Map<Integer, Boolean> dataSeatChecked = new HashMap<>();
        Map<Integer, Boolean> dataSeatDisabled = new HashMap<>();
        for (int i = 1; i <= row; i++) {
            for (int j = 1; j <= col; j++) {
                int index = row * (i - 1) + j - 1;
                dataSeatChecked.put(index, allSeats[index] == '1');
                dataSeatDisabled.put(index, allSeats[index] == '1' && bookSeat[index] == '0');
            }
        }
        // create list row
        List<Integer> rows = getListRow(row);
        // create list col
        List<Integer> cols = getListCol(col);
        map.put("dataChecked", dataSeatChecked);
        map.put("dataDisabled", dataSeatDisabled);
        map.put("book", book);
        map.put("rows", rows);
        map.put("cols", cols);
        map.put("numberRow", row);
        map.put("numberCol", col);
        return map;
    }

    @Nullable
    public Map<String, Object> Update(int BookingID, BookingCreateUpdateDTO DTO, List<Integer> seats){
        Map<String, Object> map = Update(BookingID);
        if(map == null){
            return null;
        }
        // check booking exist
        boolean check = bookRepo.findAll().stream().anyMatch(b -> b.getName().equalsIgnoreCase(DTO.getName().trim())
                && b.getShow().getShowId() == DTO.getShowID() && b.getBookingId() != BookingID);
        // if exist booking
        if (check) {
            map.put("error", "Book with name '" + DTO.getName().trim() + "' existed");
            return map;
        }
        Booking book = (Booking) map.get("book");
        int row = (int) map.get("numberRow");
        int col = (int) map.get("numberCol");
        // set all seat not booked
        String seatStatus = String.valueOf('0').repeat(row * col);
        char[] seatUpdate = seatStatus.toCharArray();
        for(Integer item : seats){
            seatUpdate[item] = '1';
        }
        // -------------------------------------- UPDATE BOOK -------------------------------------
        book.setName(DTO.getName().trim());
        book.setAmount(DTO.getAmount());
        book.setSeatStatus(String.valueOf(seatUpdate));
        bookRepo.save(book);
        map.remove("book");
        map.put("book", book);
        // --------------------------------------- SET DATA SEAT CHECKED AND DISABLED --------------------------
        List<Booking> list = bookRepo.findAll().stream().filter(b -> b.getShow().getShowId() == book.getShow().getShowId()).toList();
        map.remove("dataChecked");
        map.remove("dataDisabled");
        char[] allSeats = seatStatus.toCharArray();
        for (Booking item : list) {
            for (int i = 0; i < item.getSeatStatus().length(); i++) {
                if (item.getSeatStatus().charAt(i) == '1') {
                    allSeats[i] = '1';
                }
            }
        }
        Map<Integer, Boolean> dataSeatChecked = new HashMap<>();
        Map<Integer, Boolean> dataSeatDisabled = new HashMap<>();
        for (int i = 1; i <= row; i++) {
            for (int j = 1; j <= col; j++) {
                int index = row * (i - 1) + j - 1;
                dataSeatChecked.put(index, allSeats[index] == '1');
                dataSeatDisabled.put(index, allSeats[index] == '1' && seatUpdate[index] == '0');
            }
        }
        map.put("dataChecked", dataSeatChecked);
        map.put("dataDisabled", dataSeatDisabled);
        map.put("success", "Update successful");
        return map;
    }

    @Nullable
    public Booking Delete(int BookingID){
        Optional<Booking> option = bookRepo.findById(BookingID);
        if(option.isEmpty()){
            return null;
        }
        bookRepo.delete(option.get());
        return option.get();
    }
}

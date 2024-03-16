package org.example.cinemamanagement.Controller;

import jakarta.servlet.http.HttpSession;
import org.example.cinemamanagement.DTO.BookingDTO.BookingCreateUpdateDTO;
import org.example.cinemamanagement.Service.BookingService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequestMapping(value = "/Booking")
public class BookingController {
    private final BookingService service;

    public BookingController(BookingService service) {
        this.service = service;
    }

    @GetMapping("/{ShowID}")
    public ModelAndView List(@PathVariable("ShowID") int ShowID, HttpSession session) {
        Map<String, Object> map = service.List(ShowID);
        if (map == null) {
            return new ModelAndView("redirect:/Show");
        }
        map.put("title", "Index");
        session.setAttribute("ShowID", ShowID);
        return new ModelAndView("/Booking/List", map);
    }

    @GetMapping("/Detail/{BookingID}")
    public ModelAndView Detail(@PathVariable("BookingID") int BookingID) {
        Map<String, Object> map = service.Detail(BookingID);
        if (map == null) {
            return new ModelAndView("redirect:/Show");
        }
        map.put("title", "Detail");
        return new ModelAndView("/Booking/Detail", map);
    }

    @GetMapping("/Create")
    public ModelAndView Create(HttpSession session) {
        String user = (String) session.getAttribute("user");
        if (user == null) {
            return new ModelAndView("redirect:/Home");
        }
        Integer ShowID = (Integer) session.getAttribute("ShowID");
        if (ShowID == null) {
            return new ModelAndView("redirect:/Show");
        }
        Map<String, Object> map = service.Create(ShowID);
        if (map == null) {
            return new ModelAndView("redirect:/Show");
        }
        map.put("title", "Create");
        return new ModelAndView("/Booking/Create", map);
    }

    @PostMapping("/Create")
    public ModelAndView Create(BookingCreateUpdateDTO DTO, @RequestParam("seat") List<Integer> checkSeat, HttpSession session) {
        String user = (String) session.getAttribute("user");
        if (user == null) {
            return new ModelAndView("redirect:/Home");
        }
        Map<String, Object> map = service.Create(DTO, checkSeat);
        if (map == null) {
            return new ModelAndView("redirect:/Show");
        }
        map.put("title", "Create");
        return new ModelAndView("/Booking/Create", map);
    }
}

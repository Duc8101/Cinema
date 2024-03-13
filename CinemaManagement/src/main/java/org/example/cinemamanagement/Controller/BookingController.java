package org.example.cinemamanagement.Controller;

import jakarta.servlet.http.HttpSession;
import org.example.cinemamanagement.Service.BookingService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
    public ModelAndView List(@PathVariable("ShowID") int ShowID, HttpSession session){
        Map<String,Object> map = service.List(ShowID);
        if(map == null){
            return new ModelAndView("redirect:/Show");
        }
        map.put("title", "Index");
        session.setAttribute("ShowID", ShowID);
        return new ModelAndView("/Booking/List", map);
    }
}

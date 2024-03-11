package org.example.cinemamanagement.Controller;

import jakarta.servlet.http.HttpSession;
import org.example.cinemamanagement.Service.ShowService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.util.*;

@Controller
@RequestMapping(value = "/Show")
public class ShowController {
    private final ShowService service;

    public ShowController(ShowService service) {
        this.service = service;
    }

    @GetMapping("")
    public ModelAndView List() throws ParseException {
        Map<String, Object> map = service.List(null, null, null);
        map.put("title", "Index");
        return new ModelAndView("/Show/list", map);
    }

    @PostMapping("")
    public ModelAndView List(int RoomID, int FilmID, String date) throws ParseException {
        Map<String, Object> map = service.List(RoomID, FilmID, date);
        map.put("title", "Index");
        return new ModelAndView("/Show/list", map);
    }

    @GetMapping("/Detail/{ID}")
    public ModelAndView Detail(@PathVariable("ID") int ShowID, HttpSession session){
        String user = (String) session.getAttribute("user");
        // if not login
        if(user == null){
            return new ModelAndView("redirect:/Home");
        }
        Map<String, Object> map = service.Detail(ShowID);
        if(map.isEmpty()){
            return new ModelAndView("redirect:/Show");
        }
        map.put("title", "Details");
        return new ModelAndView("/Show/detail", map);
    }
}

package org.example.cinemamanagement.Controller;

import jakarta.servlet.http.HttpSession;
import org.example.cinemamanagement.DTO.ShowDTO.ShowCreateDTO;
import org.example.cinemamanagement.DTO.ShowDTO.ShowUpdateDTO;
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
        return new ModelAndView("/Show/List", map);
    }

    @PostMapping("")
    public ModelAndView List(int RoomID, int FilmID, String date) throws ParseException {
        Map<String, Object> map = service.List(RoomID, FilmID, date);
        map.put("title", "Index");
        return new ModelAndView("/Show/List", map);
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
        return new ModelAndView("/Show/Detail", map);
    }

    @GetMapping("/Create")
    public ModelAndView Create(HttpSession session){
        String user = (String) session.getAttribute("user");
        // if not login
        if(user == null){
            return new ModelAndView("redirect:/Home");
        }
        Map<String, Object> map = service.Create();
        map.put("title", "Create");
        return new ModelAndView("/Show/Create", map);
    }

    @PostMapping("/Create")
    public ModelAndView Create(ShowCreateDTO DTO, HttpSession session) throws ParseException {
        String user = (String) session.getAttribute("user");
        // if not login
        if(user == null){
            return new ModelAndView("redirect:/Home");
        }
        Map<String, Object> map = service.Create(DTO);
        map.put("title", "Create");
        return new ModelAndView("/Show/Create", map);
    }

    @GetMapping("/Update/{ID}")
    public ModelAndView Update(@PathVariable("ID") int ShowID, HttpSession session){
        String user = (String) session.getAttribute("user");
        // if not login
        if(user == null){
            return new ModelAndView("redirect:/Home");
        }
        Map<String, Object> map = service.Update(ShowID);
        if(map == null){
            return new ModelAndView("redirect:/Show");
        }
        map.put("title", "Edit");
        return new ModelAndView("/Show/Update", map);
    }

    @PostMapping("/Update/{ID}")
    public ModelAndView Update(@PathVariable("ID") int ShowID, ShowUpdateDTO DTO, HttpSession session){
        String user = (String) session.getAttribute("user");
        // if not login
        if(user == null){
            return new ModelAndView("redirect:/Home");
        }
        Map<String, Object> map = service.Update(ShowID, DTO);
        if(map == null){
            return new ModelAndView("redirect:/Show");
        }
        map.put("title", "Edit");
        return new ModelAndView("/Show/Update", map);
    }
}

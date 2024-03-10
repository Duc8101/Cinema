package org.example.cinemamanagement.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequestMapping(value = "/Home")
public class HomeController {
    @GetMapping("")
    public ModelAndView Index() {
        Map<String, String> map = new HashMap<>();
        map.put("title", "Home Page");
        return new ModelAndView("/Home/index", map);
    }

    @GetMapping("/Privacy")
    public ModelAndView Privacy() {
        Map<String, String> map = new HashMap<>();
        map.put("title", "Privacy Policy");
        return new ModelAndView("/Home/privacy", map);
    }
}

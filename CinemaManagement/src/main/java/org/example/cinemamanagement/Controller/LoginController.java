package org.example.cinemamanagement.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/Login")
public class LoginController {
    @GetMapping("")
    public ModelAndView Index() {
        Map<String, String> map = new HashMap<>();
        map.put("title", "Login");
        return new ModelAndView("/Login/index", map);
    }
}

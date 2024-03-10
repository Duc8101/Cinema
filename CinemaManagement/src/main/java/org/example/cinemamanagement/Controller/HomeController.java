package org.example.cinemamanagement.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/Home")
public class HomeController {
    @GetMapping("")
    public String index(){
        return "/Home/index";
    }
}

package org.example.cinemamanagement.Controller;

import jakarta.servlet.http.HttpSession;
import org.example.cinemamanagement.Service.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/Login")
public class LoginController {
    private final LoginService service;

    public LoginController(LoginService service) {
        this.service = service;
    }

    @GetMapping("")
    public ModelAndView Index() {
        Map<String, String> map = new HashMap<>();
        map.put("title", "Login");
        return new ModelAndView("/Login/Index", map);
    }

    @PostMapping("")
    public ModelAndView Index(String username, String password, HttpSession session) {
        Map<String, String> map = new HashMap<>();
        map.put("title", "Login");
        boolean isSuccess = service.Index(username, password);
        if (isSuccess) {
            session.setAttribute("user", username);
            return new ModelAndView("redirect:/Home");
        }
        map.put("message", "Don't have that user");
        return new ModelAndView("/Login/Index", map);
    }

}

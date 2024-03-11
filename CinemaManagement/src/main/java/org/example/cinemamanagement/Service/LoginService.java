package org.example.cinemamanagement.Service;

import org.example.cinemamanagement.Const.LoginConst;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
    public boolean Index(String username ,String password){
        return LoginConst.USER_LOGIN.equalsIgnoreCase(username) && LoginConst.PASSWORD_LOGIN.equals(password);
    }
}

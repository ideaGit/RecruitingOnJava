package com.xjtu.controller;

import com.xjtu.dao.UserDao;
import com.xjtu.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "/admin")
    public String view(ModelMap modelMap) {
        List<User> users = userDao.all();
        modelMap.put("users", users);
        return "admin";
    }

    @RequestMapping(value = "/login")
    public String login() {
        return "admin_login";
    }
}

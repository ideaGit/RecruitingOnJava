package com.xjtu.controller;

import com.xjtu.dao.UserDao;
import com.xjtu.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

@Controller
public class UserController {

    @Autowired
    private UserDao userDao;
    private final Validator validator;

    public UserController() {
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        validator = factory.getValidator();
    }

    @Transactional
    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public String index(@RequestParam("name") String name, @RequestParam("university") String university,
                        @RequestParam("phone") String phone, @RequestParam("email") String email,
                        @RequestParam("major") String major) {

        User user = new User(name, university, phone, email, major);

        if (validator.validate(user).isEmpty()) {
            userDao.save(user);
            return "success";
        } else {
            return "error";
        }

    }

    public void setDao(UserDao dao) {
        this.userDao = dao;
    }
}

package com.xjtu.controller;

import com.xjtu.dao.UserDao;
import com.xjtu.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
                        @RequestParam("major") String major, ModelMap modelMap) {

        User user = new User(name, university, phone, email, major);

        Set<ConstraintViolation<User>> constraintViolations = validator.validate(user);
        if (constraintViolations.isEmpty()) {
            userDao.save(user);
            return "success";
        } else {
            List<String> errors = new ArrayList<String>();
            for (ConstraintViolation<User> violation : constraintViolations) {
                errors.add(violation.getMessage());
            }
            modelMap.put("errors", errors);
            return "index";
        }

    }

    public void setDao(UserDao dao) {
        this.userDao = dao;
    }
}

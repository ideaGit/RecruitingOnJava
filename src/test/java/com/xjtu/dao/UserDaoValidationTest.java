package com.xjtu.dao;

import com.xjtu.domain.User;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.util.Set;

import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;

@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class UserDaoValidationTest extends AbstractTransactionalJUnit4SpringContextTests {

    @Autowired
    private UserDao userDao;
    private Validator validator;

    @Before
    public void setUp() throws Exception {
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        validator = factory.getValidator();
    }

    @Test
    public void should_be_invalid_if_name_is_empty() {
        User user = new User("", "university", "34567", "mail", "major");

        Set<ConstraintViolation<User>> constraintViolations = validator.validate((user));

        assertThat(constraintViolations.size(), is(1));
        ConstraintViolation<User> nameViolation = (ConstraintViolation<User>) constraintViolations.toArray()[0];
        assertThat(nameViolation.getMessage(), is("Name can not be empty"));
    }

}

package com.xjtu.dao;

import com.xjtu.domain.User;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;

@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class UserDaoValidationTest extends AbstractTransactionalJUnit4SpringContextTests {

    @Autowired
    private UserDao userDao;
    private Validator validator;
    private Map<String,String> expectedErrors;

    @Before
    public void setUp() throws Exception {
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        validator = factory.getValidator();
        expectedErrors = getExpectedErrors();
    }

    @Test
    public void should_be_invalid_if_name_is_empty() {
        User user = new User("", "", "", "", "");

        Set<ConstraintViolation<User>> constraintViolations = validator.validate((user));

        assertThat(constraintViolations.size(), is(5));
        for (ConstraintViolation<User> error : constraintViolations) {
            assertThat(error.getMessage(), is(getExpectedErrorFor(error)));
        }
    }

    private String getExpectedErrorFor(ConstraintViolation<User> error) {
        return expectedErrors.get(error.getPropertyPath().toString());
    }

    private Map<String, String> getExpectedErrors() {
        Map<String, String> expectedErrors = new HashMap<String, String>();
        expectedErrors.put("name", "Name can not be empty");
        expectedErrors.put("university", "University can not be empty");
        expectedErrors.put("phone", "Phone can not be empty");
        expectedErrors.put("email" , "Email can not be empty");
        expectedErrors.put("major" , "Major can not be empty");
        return expectedErrors;
    }

}

package com.xjtu.controller;

import com.xjtu.dao.UserDao;
import com.xjtu.domain.User;
import org.junit.Before;
import org.junit.Test;

import static org.mockito.Matchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

public class UserControllerTest {

    private UserController controller;
    private UserDao dao;

    @Before
    public void setUp() throws Exception {
        controller = new UserController();
        dao = mock(UserDao.class);
        controller.setDao(dao);
    }

    @Test
    public void should_create_a_user_and_save_him() {
        controller.index("Zhang San", "XJTU", "123987", "abc@abc.com", "Software", null);

        verify(dao).save(any(User.class));
    }

}

package com.xjtu.dao;

import com.xjtu.domain.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.validation.ConstraintViolationException;

import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;

@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@TransactionConfiguration(defaultRollback = false)
public class UserDaoTest extends AbstractTransactionalJUnit4SpringContextTests {

    @Autowired
    private UserDao userDao;

    @Test
    public void should_select_all_users() throws Exception {
        userDao.deleteAll();
        User user = new User("wangyan", "xjty", "1333333333", "me@email.com", "SE");
        userDao.save(user);
        assertEquals(1, userDao.all().size());
        assertEquals("wangyan", userDao.all().get(0).getName());
        assertEquals("xjty", userDao.all().get(0).getUniversity());
        assertEquals("1333333333", userDao.all().get(0).getPhone());
        assertEquals("me@email.com", userDao.all().get(0).getEmail());
        assertEquals("SE", userDao.all().get(0).getMajor());
    }


}

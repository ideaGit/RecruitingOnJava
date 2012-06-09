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
        User user = new User("wangyan", "xjty", "asd", "asd", "asd");
        userDao.save(user);
        assertEquals(1, userDao.all().size());
    }

    @Test
    public void should_save_phone_number_for_user () {
        userDao.deleteAll();
        User user = new User();
        user.setName("name");
        user.setPhone("1333333333");
        userDao.save(user);
        assertEquals("1333333333", userDao.all().get(0).getPhone());
    }

    @Test
    public void should_save_email_for_user () {
        userDao.deleteAll();
        User user = new User();
        user.setName("name");
        user.setEmail("bonnshore@gmail.com");
        userDao.save(user);
        assertEquals("bonnshore@gmail.com", userDao.all().get(0).getEmail());
    }

    @Test
    public void shoule_save_major_for_user(){
        userDao.deleteAll();
        User user = new User();
        user.setName("name");
        user.setMajor("software");
        userDao.save(user);
        assertEquals("software", userDao.all().get(0).getMajor());
    }


}

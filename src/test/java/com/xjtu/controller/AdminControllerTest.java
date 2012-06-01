package com.xjtu.controller;

import org.junit.Before;
import org.junit.Test;
import org.springframework.ui.ModelMap;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

public class AdminControllerTest {
    private AdminController controller;

    @Before
    public void setUp() throws Exception {
        controller = new AdminController();
    }

    @Test
    public void shouldRedirectToAdminLoginPage() throws Exception {
        assertThat(controller.login(), is("admin_login"));
    }
}

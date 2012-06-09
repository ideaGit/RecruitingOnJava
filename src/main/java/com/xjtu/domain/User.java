package com.xjtu.domain;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @NotEmpty(message = "Name can not be empty")
    private String name;

    private String university;

    private String phone;

    private String email;
    private String major;


    public String getName() {
        return name;
    }

    public long getUserId() {
        return id;
    }

    public String getUniversity() {
        return university;
    }

    public void setId(long id) {
        this.id = id;
    }


    public User() {
    }

    public User(String name, String university, String phone, String email, String major) {
        this.university = university;
        this.name = name;
        this.email = email;
        this.major = major;
        this.phone = phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setName(String name) {
        this.name = name;
    }
}

package com.xjtu.domain;

import javax.persistence.*;


@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

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

    public User(String name, String university) {
        this.university = university;
        this.name = name;
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
}

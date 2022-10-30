package com.exam.entity;

import lombok.Data;

@Data
public class Admin {
    private Integer adminId;

    private String adminName;

    private String sex;

    private String tel;

    private String email;

    private String pwd;

    private String cardId;

    private String role;

    public Admin(int i, String admin, String sex, String s, String s1, String s2, String s3, String s4) {
        adminId = i;
        adminName = admin;
        this.sex = sex;
        tel = s;
        email = s1;
        pwd = s2;
        cardId = s3;
        role = s4;
    }
}
package com.hanxu.entity;

import lombok.Data;

@Data
public class Address {
    private Integer id;

    private String shouhuoren;

    private String phone;

    private String address;

    private Integer userid;

    private String isdefault;
}
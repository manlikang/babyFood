package com.hanxu.entity;

import lombok.Data;

@Data
public class User {
    private Integer id;

    private String username;

    private String nickname;

    private String truename ;

    private String sex ;

    private String birthday;

    private String phone;

    private String email;

    private String memberRank;

    private Integer integral;

    private Integer usefulIntegral;

    private Integer usedIntegral;

    private Integer frozen;

    private String picPath;

    private String password;

    private String isadmin;
}
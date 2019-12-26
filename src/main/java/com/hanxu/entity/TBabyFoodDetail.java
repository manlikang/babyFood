package com.hanxu.entity;

import lombok.Data;

@Data
public class TBabyFoodDetail {
    private Integer id;

    private String detailName;

    private String ageRange;

    private String packing;

    private String profile;

    private String detailProfile;

    private String warn;

    private Integer integral;

    private Integer foodId;

    private Integer isDelete=0;
}
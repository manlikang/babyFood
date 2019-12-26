package com.hanxu.entity.domain;

import lombok.Data;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/11
 */
@Data
public class FoodDetail {

    private Integer id;

    private String detailName;

    private String ageRange;

    private String packing;

    private String profile;

    private String detailProfile;

    private String warn;

    private int integral;

    private Integer foodId;

    private String pic;

    private int price;

    private String foodType;
}

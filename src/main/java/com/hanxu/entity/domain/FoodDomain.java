package com.hanxu.entity.domain;

import lombok.Data;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/14
 */
@Data
public class FoodDomain {
    private Integer id;

    private String foodName;

    private String origin;

    private String foodtype;

    private String foodpic;

    private Integer foodPrice;

    private Integer integral;

    private Integer count;
}

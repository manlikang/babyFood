package com.hanxu.entity.domain;

import lombok.Data;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/15
 */
@Data
public class OrderInfo {
    private int userId;
    private int shouldPay;
    private double infactPay;
    private int getIntegral;
    private double integralDikou;
    private double memberDikou;
    private String shouhuoren;
    private String phone;
    private String address;
    private String express;
    private String payMethod;

}

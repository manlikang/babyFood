package com.hanxu.entity;

import java.util.Date;
import lombok.Data;

@Data
public class TOrderDetail {
    private Integer id;

    private Integer orderid;

    private Integer foodid;

    private String foodname;

    private Date orderdate;

    private Double foodprice;

    private Integer foodnum;

    private String foodpic;

    private Double foodTotalPrice;
}
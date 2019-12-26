package com.hanxu.entity;

import java.util.Date;
import lombok.Data;

@Data
public class TOrder {
    private Integer id;

    private String sendtype;

    private String paytype;

    private Double paycount;

    private Date orderdate;

    private Integer userid;

    private String shperson;

    private String shphone;

    private String shaddress;
}
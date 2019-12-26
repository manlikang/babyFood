package com.hanxu.controller;

import com.hanxu.entity.TOrder;
import com.hanxu.entity.TOrderDetail;
import com.hanxu.entity.common.MyPage;
import com.hanxu.entity.common.Result;
import com.hanxu.service.IOrderDetailService;
import com.hanxu.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/15
 */
@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private IOrderService orderService;
    @Autowired
    private IOrderDetailService orderDetailService;

    @RequestMapping("list")
    public String getList(MyPage<TOrder> page, Model model){
        page =orderService.getList(page);
        page.setUrl("order/list");
        model.addAttribute("pageInfo",page);
        return "back/page/orderinfo";
    }

    @RequestMapping("detaillist")
    public String getDetailList(MyPage<TOrderDetail> page, Model model){
        page =orderDetailService.getList(page);
        page.setUrl("order/detaillist");
        model.addAttribute("pageInfo",page);
        return "back/page/orderDetailinfo";
    }

    @RequestMapping("serachOrderDetailByOrderId/{orderId}")
    public String serachOrderDetailByOrderId(MyPage<TOrderDetail> page, @PathVariable int orderId,Model model){
        page = orderDetailService.getListByOrderId(page,orderId);
        page.setUrl("order/serachOrderDetailByOrderId/"+orderId);
        model.addAttribute("pageInfo",page);
        return "back/page/orderDetailinfo";
    }



}

package com.hanxu.service;

import com.hanxu.entity.TOrderDetail;
import com.hanxu.entity.common.MyPage;

import java.util.List;

public interface IOrderDetailService extends IBaseService<TOrderDetail> {

    MyPage<TOrderDetail> getList(MyPage<TOrderDetail> page);

    MyPage<TOrderDetail> getListByUserId(int id, MyPage<TOrderDetail> orderDetailPage);

    MyPage<TOrderDetail> getListByOrderId(MyPage<TOrderDetail> page, int orderId);
}

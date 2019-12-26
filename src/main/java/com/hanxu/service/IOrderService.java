package com.hanxu.service;

import com.hanxu.entity.TOrder;
import com.hanxu.entity.common.MyPage;

public interface IOrderService extends IBaseService<TOrder> {
    Integer getOrderIdByUserId(int id);

    MyPage<TOrder> getList(MyPage<TOrder> page);
}

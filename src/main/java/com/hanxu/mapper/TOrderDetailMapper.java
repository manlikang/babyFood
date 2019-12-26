package com.hanxu.mapper;

import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.TOrderDetail;
import com.hanxu.entity.common.MyPage;

import java.util.List;

public interface TOrderDetailMapper extends IBaseDao<TOrderDetail> {




    List<TOrderDetail> getList();

    List<TOrderDetail> getListByUserId(int userid);

    List<TOrderDetail> getListByOrderId(int orderId);

}
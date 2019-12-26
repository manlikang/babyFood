package com.hanxu.mapper;

import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.TOrder;

import java.util.List;

public interface TOrderMapper extends IBaseDao<TOrder> {

    Integer getOrderIdByUserId(int userId);

    List<TOrder> getList();

}
package com.hanxu.service.impl;

import com.github.pagehelper.PageHelper;
import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.TOrder;
import com.hanxu.entity.common.MyPage;
import com.hanxu.mapper.TOrderDetailMapper;
import com.hanxu.mapper.TOrderMapper;
import com.hanxu.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/15
 */
@Service
public class OrderService extends BaseServiceImpl<TOrder> implements IOrderService {
    @Autowired
    private TOrderMapper orderMapper;
    @Override
    public IBaseDao<TOrder> getDao() {
        return orderMapper;
    }

    @Override
    public Integer getOrderIdByUserId(int userId) {
        return orderMapper.getOrderIdByUserId(userId);
    }

    @Override
    public MyPage<TOrder> getList(MyPage<TOrder> page) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<TOrder> list = orderMapper.getList();
        return new MyPage<>(list);
    }
}

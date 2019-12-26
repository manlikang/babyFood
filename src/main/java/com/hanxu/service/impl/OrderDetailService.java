package com.hanxu.service.impl;

import com.github.pagehelper.PageHelper;
import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.TOrderDetail;
import com.hanxu.entity.common.MyPage;
import com.hanxu.mapper.TOrderDetailMapper;
import com.hanxu.service.IOrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/15
 */
@Service
public class OrderDetailService extends BaseServiceImpl<TOrderDetail> implements IOrderDetailService {
    @Autowired
    private TOrderDetailMapper orderDetailMapper;

    @Override
    public IBaseDao<TOrderDetail> getDao() {
        return orderDetailMapper;
    }


    @Override
    public MyPage<TOrderDetail> getList(MyPage<TOrderDetail> page) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<TOrderDetail> list = orderDetailMapper.getList();
        return new MyPage<>(list);
    }

    @Override
    public MyPage<TOrderDetail> getListByUserId(int userid, MyPage<TOrderDetail> orderDetailPage) {
        PageHelper.startPage(orderDetailPage.getCurrentPage(),orderDetailPage.getPageSize());
        List<TOrderDetail> list = orderDetailMapper.getListByUserId(userid);
        return new MyPage<>(list) ;
    }

    @Override
    public MyPage<TOrderDetail> getListByOrderId(MyPage<TOrderDetail> page, int orderId) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<TOrderDetail> list = orderDetailMapper.getListByOrderId(orderId);
        return new MyPage<>(list);
    }
}

package com.hanxu.service.impl;

import com.github.pagehelper.PageHelper;
import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.TIntegral;
import com.hanxu.entity.common.MyPage;
import com.hanxu.mapper.TIntegralMapper;
import com.hanxu.service.IIntegralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/15
 */
@Service
public class IntegralService extends BaseServiceImpl<TIntegral> implements IIntegralService {

    @Autowired
    private TIntegralMapper integralMapper;
    @Override
    public IBaseDao<TIntegral> getDao() {
        return integralMapper;
    }

    @Override
    public MyPage<TIntegral> getListByUserId(int id, MyPage<TIntegral> integralPage) {
        PageHelper.startPage(integralPage.getCurrentPage(),integralPage.getPageSize());
        List<TIntegral> list = integralMapper.getListByUserId(id);

        return new MyPage<>(list);
    }
}

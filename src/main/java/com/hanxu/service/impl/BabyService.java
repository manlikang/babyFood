package com.hanxu.service.impl;

import com.github.pagehelper.PageHelper;
import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.Baby;
import com.hanxu.entity.common.MyPage;
import com.hanxu.mapper.BabyMapper;
import com.hanxu.service.IBabyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/11
 */

@Service
public class BabyService extends BaseServiceImpl<Baby> implements IBabyService {

    @Autowired
    private BabyMapper babyMapper;
    @Override
    public IBaseDao<Baby> getDao() {
        return babyMapper;
    }

    @Override
    public MyPage<Baby> getList(MyPage<Baby> myPage) {
        PageHelper.startPage(myPage.getCurrentPage(),myPage.getPageSize());
        List<Baby> list = babyMapper.getList();
        return new MyPage<>(list);
    }

    @Override
    public void updatelike(int id, int num) {
        Baby baby = new Baby();
        baby.setId(id);
        baby.setLike(num);

        babyMapper.updateByPrimaryKeySelective(baby);
    }


}

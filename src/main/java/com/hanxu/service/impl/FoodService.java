package com.hanxu.service.impl;

import com.github.pagehelper.PageHelper;
import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.BabyFood;
import com.hanxu.entity.common.MyPage;
import com.hanxu.mapper.BabyFoodMapper;
import com.hanxu.service.IFoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/10
 */

@Service
public class FoodService extends BaseServiceImpl<BabyFood> implements IFoodService {

    @Autowired
    private BabyFoodMapper babyFoodMapper;
    @Override
    public IBaseDao<BabyFood> getDao() {
        return babyFoodMapper;
    }

    @Override
    public MyPage<BabyFood> getListByPage(MyPage<BabyFood> page) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<BabyFood> list = babyFoodMapper.getList();
        return new MyPage<>(list);
    }

    @Override
    public int del(int id) {
        return babyFoodMapper.del(id);
    }

    @Override
    public MyPage<BabyFood> getListByType(MyPage<BabyFood> page, int type) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        String strType="";
        if(type == 1){
            strType="婴幼儿";
        }else if(type == 2){
            strType="幼儿";
        }else {
            strType = "孕产妇";
        }
        List<BabyFood> list = babyFoodMapper.getListByType(strType);
        return new MyPage<>(list);
    }

    @Override
    public MyPage<BabyFood> serachByName(MyPage<BabyFood> myPage, String foodName) {
        PageHelper.startPage(myPage.getCurrentPage(),myPage.getPageSize());
        List<BabyFood> list = babyFoodMapper.getListByName(foodName);
        return new MyPage<>(list);
    }

    @Override
    public List<BabyFood> getList() {
        return babyFoodMapper.getList();
    }


}

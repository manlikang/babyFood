package com.hanxu.service.impl;

import com.github.pagehelper.PageHelper;
import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.TBabyFoodDetail;
import com.hanxu.entity.common.MyPage;
import com.hanxu.entity.domain.FoodDetail;
import com.hanxu.mapper.TBabyFoodDetailMapper;
import com.hanxu.service.IFoodDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/11
 */

@Service
public class FoodDetailService extends BaseServiceImpl<TBabyFoodDetail> implements IFoodDetailService {

    @Autowired
    private TBabyFoodDetailMapper babyFoodDetailMapper;
    @Override
    public IBaseDao<TBabyFoodDetail> getDao() {
        return babyFoodDetailMapper;
    }

    @Override
    public MyPage<TBabyFoodDetail> getList(MyPage<TBabyFoodDetail> myPage) {
        PageHelper.startPage(myPage.getCurrentPage(),myPage.getPageSize());
        List<TBabyFoodDetail> list = babyFoodDetailMapper.getList();

        return new MyPage<>(list);
    }

    @Override
    public FoodDetail getFoodDetailByFoodId(int foodId) {
        return babyFoodDetailMapper.getFoodDetailByFoodId(foodId);
    }


}

package com.hanxu.mapper;

import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.TBabyFoodDetail;
import com.hanxu.entity.domain.FoodDetail;

import java.util.List;

public interface TBabyFoodDetailMapper extends IBaseDao<TBabyFoodDetail> {

    List<TBabyFoodDetail> getList();


    FoodDetail getFoodDetailByFoodId(int foodId);
}
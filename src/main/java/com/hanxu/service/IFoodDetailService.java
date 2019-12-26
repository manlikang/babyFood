package com.hanxu.service;

import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.TBabyFoodDetail;
import com.hanxu.entity.common.MyPage;
import com.hanxu.entity.domain.FoodDetail;

public interface IFoodDetailService extends IBaseDao<TBabyFoodDetail> {
    MyPage<TBabyFoodDetail> getList(MyPage<TBabyFoodDetail> myPage);


    FoodDetail getFoodDetailByFoodId(int foodId);
}

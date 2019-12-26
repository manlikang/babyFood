package com.hanxu.service;


import com.hanxu.entity.BabyFood;
import com.hanxu.entity.common.MyPage;

import java.util.List;


/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/10
 */

public interface IFoodService extends IBaseService<BabyFood> {
    MyPage<BabyFood> getListByPage(MyPage<BabyFood> page);

    int del(int id);

    MyPage<BabyFood> getListByType(MyPage<BabyFood> page, int type);


    MyPage<BabyFood> serachByName(MyPage<BabyFood> myPage, String foodName);

    List<BabyFood> getList();
}

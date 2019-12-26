package com.hanxu.mapper;

import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.BabyFood;

import java.util.List;

public interface BabyFoodMapper extends IBaseDao<BabyFood> {

    List<BabyFood> getList();

    int del(int id);

    List<BabyFood> getListByType(String strType);

    List<BabyFood> getListByName(String foodName);
}
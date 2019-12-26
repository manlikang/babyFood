package com.hanxu.mapper;

import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.TIntegral;

import java.util.List;

public interface TIntegralMapper extends IBaseDao<TIntegral> {

    List<TIntegral> getListByUserId(int id);
}
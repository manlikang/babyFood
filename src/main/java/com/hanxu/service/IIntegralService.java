package com.hanxu.service;

import com.hanxu.entity.TIntegral;
import com.hanxu.entity.common.MyPage;

import java.util.List;

public interface IIntegralService extends IBaseService<TIntegral> {
    MyPage<TIntegral> getListByUserId(int id, MyPage<TIntegral> integralPage);
}

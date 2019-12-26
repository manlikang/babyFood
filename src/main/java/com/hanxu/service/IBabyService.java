package com.hanxu.service;

import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.Baby;
import com.hanxu.entity.common.MyPage;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/11
 */
public interface IBabyService extends IBaseDao<Baby> {
    MyPage<Baby> getList(MyPage<Baby> myPage);


    void updatelike(int id, int num);
}

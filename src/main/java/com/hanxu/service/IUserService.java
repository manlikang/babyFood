package com.hanxu.service;

import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.User;
import com.hanxu.entity.common.MyPage;

import java.util.List;

public interface IUserService extends IBaseDao<User> {


    List<User> getList();

    MyPage<User> getListByPage(MyPage<User> page);

    int delById(int id);


    int setAdmin(int id);

    int reAdmin(int id);

    User getUserByPhone(String username);

    int isExist(String username);

    int reduceIntegral(double v,int userId);


    int addIntegral(int getIntegral, int userId);

    int batchDel(List<Integer> ids);

    boolean hasPhone(String phone);

    List<String> getPhoneListById(List<Integer> ids);
}

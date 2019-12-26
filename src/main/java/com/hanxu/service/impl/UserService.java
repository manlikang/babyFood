package com.hanxu.service.impl;

import com.github.pagehelper.PageHelper;
import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.User;
import com.hanxu.entity.common.MyPage;
import com.hanxu.mapper.UserMapper;
import com.hanxu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/10
 */

@Service
public class UserService extends BaseServiceImpl<User> implements IUserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public IBaseDao<User> getDao() {
        return userMapper;
    }

    @Override
    public List<User> getList() {
        return userMapper.getList();
    }

    @Override
    public MyPage<User> getListByPage(MyPage<User> page) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<User> list = userMapper.getList();
        return  new MyPage<>(list);


    }

    @Override
    public int delById(int id) {
        return userMapper.delById(id);
    }

    @Override
    public int setAdmin(int id) {
        return userMapper.setAdmin(id);
    }

    @Override
    public int reAdmin(int id) {
        return userMapper.reAdmin(id);
    }

    @Override
    public User getUserByPhone(String username) {
        return userMapper.getUserByPhone(username);
    }

    @Override
    public int isExist(String username) {
        return userMapper.isExist(username);
    }

    @Override
    public int reduceIntegral(double v,int userId) {
        int integral = (int)v;
        return userMapper.reduceIntegral(integral,userId);
    }

    @Override
    public int addIntegral(int getIntegral, int userId) {
        return userMapper.addIntegral(getIntegral,userId);
    }

    @Override
    public int batchDel(List<Integer> ids) {
        return userMapper.batchDel(ids);
    }

    @Override
    public boolean hasPhone(String phone) {
        int i =userMapper.hasPhone(phone);
        if(i>0){
            return true;
        }
        return false;
    }

    @Override
    public List<String> getPhoneListById(List<Integer> ids) {
        return userMapper.getPhoneListById(ids);
    }


}

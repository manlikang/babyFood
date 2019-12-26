package com.hanxu.mapper;

import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

public interface UserMapper extends IBaseDao<User> {
    List<User> getList();


    int delById(int id);

    int setAdmin(int id);

    int reAdmin(int id);

    User getUserByPhone(String phone);

    int isExist(String username);

    int reduceIntegral(@Param("integral") Integer integral, @Param("userId") int userId);

    int addIntegral(@Param("integral") int getIntegral,@Param("userId") int userId);

    int batchDel(List<Integer> ids);

    int hasPhone(String phone);

    List<String> getPhoneListById(List<Integer> ids);
}

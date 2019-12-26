package com.hanxu.mapper;

import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.Address;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

public interface AddressMapper extends IBaseDao<Address> {

    List<Address> getListByUserId(int id);

    int updateDefault(@Param("isDefault") String isDefault, @Param("userId") int userId);
}
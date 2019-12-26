package com.hanxu.service;

import com.hanxu.entity.Address;
import com.hanxu.entity.common.MyPage;

import java.util.List;

public interface IAddressService extends IBaseService<Address> {
    MyPage<Address> getListByUserId(int id, MyPage<Address> addressPage);

    int updateDefult(String isDefault, int userId);

    List<Address> getListByUserIdNoPage(int id);
}

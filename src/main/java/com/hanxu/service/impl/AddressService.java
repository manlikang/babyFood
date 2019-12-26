package com.hanxu.service.impl;

import com.github.pagehelper.PageHelper;
import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.Address;
import com.hanxu.entity.common.MyPage;
import com.hanxu.mapper.AddressMapper;
import com.hanxu.service.IAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/14
 */
@Service
public class AddressService extends BaseServiceImpl<Address> implements IAddressService {
    @Autowired
    private AddressMapper addressMapper;
    @Override
    public IBaseDao<Address> getDao() {
        return addressMapper;
    }

    @Override
    public MyPage<Address> getListByUserId(int id, MyPage<Address> addressPage) {
        PageHelper.startPage(addressPage.getCurrentPage(),addressPage.getPageSize());
        List<Address> list = addressMapper.getListByUserId(id);
        return new MyPage<>(list);
    }

    @Override
    public int updateDefult(String isDefault, int userId) {
        return addressMapper.updateDefault(isDefault,userId);
    }

    @Override
    public List<Address> getListByUserIdNoPage(int id) {
        return addressMapper.getListByUserId(id);
    }
}

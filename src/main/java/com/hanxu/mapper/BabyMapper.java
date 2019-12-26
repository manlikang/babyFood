package com.hanxu.mapper;

import com.hanxu.dao.IBaseDao;
import com.hanxu.entity.Baby;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BabyMapper extends IBaseDao<Baby> {

    List<Baby> getList();


}
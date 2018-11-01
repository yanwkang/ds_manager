package com.mr.mapper;

import java.util.List;

import com.mr.model.ObjectTMallAttr;
import com.mr.model.TMallAttr;
import org.apache.ibatis.annotations.Param;

public interface TMallAttrMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TMallAttr record);

    int insertSelective(TMallAttr record);

    TMallAttr selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TMallAttr record);

    int updateByPrimaryKey(TMallAttr record);

	void insertAttr(@Param("flbh2") Integer flbh2, @Param("attr") ObjectTMallAttr attr);

	List<ObjectTMallAttr> getAttrList(@Param("flbh2") Integer flbh2);

}
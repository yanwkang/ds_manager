package com.mr.mapper;

import com.mr.model.TMallProductImage;

import java.util.Map;

public interface TMallProductImageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TMallProductImage record);

    int insertSelective(TMallProductImage record);

    TMallProductImage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TMallProductImage record);

    int updateByPrimaryKey(TMallProductImage record);

	void insertSelectives(Map<String, Object> map);
}
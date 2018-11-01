package com.mr.mapper;

import java.util.List;

import com.mr.model.TMallProduct;
import org.apache.ibatis.annotations.Param;

public interface TMallProductMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TMallProduct record);

    int insertSelective(TMallProduct record);

    TMallProduct selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TMallProduct record);

    int updateByPrimaryKey(TMallProduct record);

	List<TMallProduct> getSpuList(@Param("flbh2") Integer flbh2, @Param("ppId") Integer ppId);
}
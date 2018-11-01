package com.mr.mapper;

import java.util.List;

import com.mr.model.TMallSkuVO;
import com.mr.model.TMallSkuValue;
import org.apache.ibatis.annotations.Param;

public interface TMallSkuMapper {
	
	void addSku(TMallSkuVO skuvo);

	void addSkuValue(@Param("list") List<TMallSkuValue> list, @Param("skuId") Integer skuId, @Param("shopId") Integer shopId);

}

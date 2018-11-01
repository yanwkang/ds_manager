package com.mr.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mr.mapper.TMallProductImageMapper;
import com.mr.mapper.TMallProductMapper;
import com.mr.model.TMallProduct;
import com.mr.model.TMallSkuVO;
import com.mr.service.TMallProductService;

@Service
public class TMallProductServiceImpl implements TMallProductService {

	@Autowired
	private TMallProductMapper mallProductMapper;
	
	@Autowired
	private TMallProductImageMapper productImageMapper;

	/**
	 * 增加数据
	 */
	public void addSpu(TMallProduct mallProduct , List<String> list) {
		//将商品对象保存在数据库中，并且获取到自增的id
		mallProductMapper.insertSelective(mallProduct);
		
		//创建 map对象
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shp_id", mallProduct.getId());
		map.put("list_imgs", list);
		//增加商品图片数据
		productImageMapper.insertSelectives(map);
	}

	/**
	 * 查询商品集合
	 */
	public List<TMallProduct> getSpuList(Integer flbh2, Integer ppId) {
		return mallProductMapper.getSpuList(flbh2, ppId);
	}

	
	
	
}

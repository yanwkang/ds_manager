package com.mr.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mr.mapper.TMallSkuMapper;
import com.mr.model.TMallSkuVO;
import com.mr.service.TMallSkuService;

@Service
public class TMallSkuServiceImpl implements TMallSkuService {

	@Autowired
	private TMallSkuMapper mallSkuMapper;
	
	public void addSku(TMallSkuVO skuvo) {
		mallSkuMapper.addSku(skuvo);
		
		mallSkuMapper.addSkuValue(skuvo.getList(),skuvo.getId(),skuvo.getShpId());
	}

	
	
}

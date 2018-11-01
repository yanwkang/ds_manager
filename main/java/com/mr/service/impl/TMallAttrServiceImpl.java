package com.mr.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mr.mapper.TMallAttrMapper;
import com.mr.mapper.TMallValueMapper;
import com.mr.model.ObjectTMallAttr;
import com.mr.model.TMallAttrVO;
import com.mr.model.TMallValue;
import com.mr.service.TMallAttrService;

@Service
public class TMallAttrServiceImpl implements TMallAttrService {

	@Autowired
	private TMallAttrMapper mallAttrMapper;
	
	@Autowired
	private TMallValueMapper mallValueMapper;
	
	/**
	 * 保存商品属性和商品属性值
	 */
	/*@Override
	public void addAttr(Integer flbh2,TMallAttrVO mallAttrVO) {
		List<ObjectTMallAttr> mallAttrs = mallAttrVO.getMallAttrs();
		
		for (ObjectTMallAttr objectTMallAttr : mallAttrs) {
			//设置创建时间
			objectTMallAttr.setChjshj(new Date());
			objectTMallAttr.setFlbh2(flbh2);
			
			mallAttrMapper.insertSelective(objectTMallAttr);
			
			List<TMallValue> mallValues = objectTMallAttr.getMallValues();
			
			for (TMallValue tMallValue : mallValues) {
				tMallValue.setChjshj(new Date());
				//设置属性id
				tMallValue.setShxmId(objectTMallAttr.getId());
				
				mallValueMapper.insertSelective(tMallValue);
			}
		}
	}*/
	
	
	/**
	 * 保存商品属性和商品属性值
	 */
	public void addAttr(Integer flbh2,TMallAttrVO mallAttrVO) {
		List<ObjectTMallAttr> mallAttrs = mallAttrVO.getMallAttrs();
		for (ObjectTMallAttr objectTMallAttr : mallAttrs) {
			mallAttrMapper.insertAttr(flbh2 , objectTMallAttr);
			mallValueMapper.insertValue(objectTMallAttr.getId(),objectTMallAttr.getMallValues());
		}
	}

	/**
	 * 查询数据
	 */
	public List<ObjectTMallAttr> getAttrList(Integer flbh2) {
		return mallAttrMapper.getAttrList(flbh2);
	}
	
}

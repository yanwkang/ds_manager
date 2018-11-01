package com.mr.controller;


import java.util.List;

import com.mr.model.ObjectTMallAttr;
import com.mr.model.TMallProduct;
import com.mr.model.TMallSkuVO;
import com.mr.service.TMallAttrService;
import com.mr.service.TMallProductService;
import com.mr.service.TMallSkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SkuController {
	
	@Autowired
	private TMallProductService mallProductService;
	
	@Autowired
	private TMallAttrService mallAttrService;
	
	@Autowired
	private TMallSkuService mallSkuService;
	
	@RequestMapping("/toSkuAddPage")
	public String toSkuAddPage(ModelMap map, Integer flbh1 ,Integer flbh2) {
		List<ObjectTMallAttr> attrList = mallAttrService.getAttrList(flbh2);
		map.put("flbh1", flbh1);
		map.put("flbh2", flbh2);
		map.put("attrList", attrList);
		return "sku-add";
	}
	
	@RequestMapping("/getSpuList")
	@ResponseBody
	public List<TMallProduct> getSpuList(Integer flbh2 , Integer ppId) {
		List<TMallProduct> list = mallProductService.getSpuList(flbh2, ppId);
		return list;
	}
	@RequestMapping("/addSku")
	public String addSku(TMallSkuVO skuvo) {
		mallSkuService.addSku(skuvo);
		return "sku";
	}
	
	
}

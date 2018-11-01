package com.mr.controller;

import java.util.ArrayList;
import java.util.List;

import com.mr.model.ObjectTMallAttr;
import com.mr.model.TMallAttrVO;
import com.mr.service.TMallAttrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AttrController {
	
	@Autowired
	private TMallAttrService mallAttrService;

	@RequestMapping("/toAttrAddPage")
	public String toAttrAddPage(ModelMap map, Integer flbh2) {
		map.put("flbh2", flbh2);
		return "attr-add";
	}
	
	@RequestMapping("/addAttr")
	public ModelAndView addAttr(Integer flbh2 ,TMallAttrVO mallAttrVO) {
		mallAttrService.addAttr(flbh2,mallAttrVO);
		//添加完数据之后，重定向当添加页面，并且将之前选择的类型的数据返回去
		ModelAndView mv = new ModelAndView("redirect:toAttrAddPage.do");
		mv.addObject("flbh2", flbh2);
		return mv;
	}
	
	/**
	 * 异步加载 list 数据 
	 */
	@RequestMapping("/getAttrList")
	@ResponseBody
	public List<ObjectTMallAttr>  getAttrList(Integer flbh2, ModelMap map) {
		List<ObjectTMallAttr> list = new ArrayList<ObjectTMallAttr>();
		list = mallAttrService.getAttrList(flbh2);
		return list;
	}
	
	
}

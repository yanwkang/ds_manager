package com.mr.controller;

import java.util.Date;
import java.util.List;

import com.mr.model.TMallProduct;
import com.mr.service.TMallProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mr.util.MyFileUploadUtil;

@Controller
public class SpuController {
	
	@Autowired
	private TMallProductService mallProductService;

	/**
	 * 跳转商品增加页面，
	 * @param map 
	 * @param spu spu中存放 类型的数据
	 * @return
	 */
	@RequestMapping("/toSpuAddPage")
	public String toSpuAddPage(ModelMap map, TMallProduct spu) {
		map.put("spu", spu);
		return "spu-add";
	}
	
	/**
	 *  增加数据
	 * @param mallProduct  商品表中的内容
	 * @param files 文件集合
	 * @return
	 */
	@RequestMapping("/addSpu")
	public ModelAndView addSpu(TMallProduct mallProduct ,
			@RequestParam("files") MultipartFile[] files) {
		//1:调用工具类上传文件
		List<String> list = MyFileUploadUtil.upload_image(files);
		
		//给对象中赋值图片和创建时间
		mallProduct.setShpTp(list.get(0));
		mallProduct.setChjshj(new Date());
		
		//调用增加方法，将商品对象和图片路径集合保存起来
		mallProductService.addSpu(mallProduct , list);
		
		//添加完数据之后，重定向当添加页面，并且将之前选择的类型的数据返回去
		ModelAndView mv = new ModelAndView("redirect:toSpuAddPage.do");
		mv.addObject("flbh1", mallProduct.getFlbh1());
		mv.addObject("flbh2", mallProduct.getFlbh2());
		mv.addObject("ppId", mallProduct.getPpId());
		return mv;
	}
	
}

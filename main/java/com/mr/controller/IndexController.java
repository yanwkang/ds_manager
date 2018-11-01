package com.mr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/toMainPage")
	public String toMainPage() {
		return "main";
	}
	
	@RequestMapping("/toSpuPage")
	public String toSpuPage() {
		return "spu";
	}
	
	@RequestMapping("/toSpuAttrPage")
	public String toSpuAttrPage() {
		return "attr";
	}
	
	@RequestMapping("/toSkuPage")
	public String toSkuPage() {
		return "sku";
	}
	
}

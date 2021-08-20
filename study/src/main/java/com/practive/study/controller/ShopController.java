package com.practive.study.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShopController {

	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);
	
	//01 snackShop 페이지로 이동
	@RequestMapping(value="/snackShop.do", method=RequestMethod.GET)
	public String snackShop() {
		Logger.info("snackShop 페이지로 이동");
		return "shop/snackShop";
	}
	
	//02 snackShopDetail 페이지로 이동
	@RequestMapping(value="/snackShopDetail.do", method=RequestMethod.GET)
	public String snackShopDetail() {
		Logger.info("snackShopDetail 페이지로 이동");
		return "shop/snackShopDetail";
	}
}

package com.practive.study.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.practive.study.model.service.ShopService;
import com.practive.study.model.vo.Snack;

@Controller
public class ShopController {

	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	public ShopService service;
	
	//01 snackShop 페이지로 이동
	@RequestMapping(value="/snackShop.do", method=RequestMethod.GET)
	public String snackShop(Model model) throws Exception{
		Logger.info("snackShop 페이지로 이동");
		List<Snack> snackList = service.snackList();
		Logger.info("snack 확인"+snackList);
		model.addAttribute("snack", snackList);
		return "shop/snackShop";
	}
	
	//02 snackShopDetail 페이지로 이동
	@RequestMapping(value="/snackShopDetail.do", method=RequestMethod.GET)
	public String snackShopDetail() {
		Logger.info("snackShopDetail 페이지로 이동");
		return "shop/snackShopDetail";
	}
}

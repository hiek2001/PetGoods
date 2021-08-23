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
		// snackList 가져오기
		List<Snack> snackList = service.snackList();
		//Logger.info("snack 확인"+snackList);
		model.addAttribute("snack", snackList);
		return "shop/snackShop";
	}
	
	//02 snackShopDetail 페이지로 이동
	@RequestMapping(value="/snackShopDetail.do", method=RequestMethod.GET)
	public String snackShopDetail(int snackNo, Model model) {
		Logger.info("snackShopDetail 페이지로 이동");
		Snack snack = service.snack(snackNo);
		//Logger.info("snack 확인"+snack);
		model.addAttribute("snack", snack);
		return "shop/snackShopDetail";
	}
	
	//03 payment 페이지로 이동
	@RequestMapping(value="/payment.do", method=RequestMethod.GET)
	public String payment() {
		return "shop/payment";
	}
}

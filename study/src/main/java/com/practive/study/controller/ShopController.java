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
	
	//IamportClient api = new IamportClient("0364377215218055","ff08558eef6ca8c2a09b0d6be51e5daddd5ceb82b9a994a447efbe7d31888a92d0b060c660ae196b");
	
	
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
	public String payment(int snackNo, int count, Model model) {
		Logger.info("payment 페이지로 이동"+snackNo+"count::"+count);
		Snack snack = service.snack(snackNo);
		model.addAttribute("snack", snack);
		model.addAttribute("skcount", count);
		return "shop/payment";
	}
	
	// 04 결제API : 결제 검증 
	//@ResponseBody
	//@ReqeustMapping(value="/verifyIamport/{imp_uid}")
	//ublic Iamport
}

package com.practive.study.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.practive.study.IamportApi;
import com.practive.study.model.service.ShopService;
import com.practive.study.model.vo.Member;
import com.practive.study.model.vo.Order;
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
	public String payment(int snackNo, int count, Model model) {
		Logger.info("payment 페이지로 이동"+snackNo+"count::"+count);
		Snack snack = service.snack(snackNo);
		model.addAttribute("snack", snack);
		model.addAttribute("skcount", count);
		return "shop/payment";
	}
	
	// 04 결제API : 결제 검증 
	@ResponseBody
	@RequestMapping(value="/verifyIamport")
	public void Iamport(@RequestBody HashMap<String,String> map) throws Exception{
		Logger.info("/verifyIamport Controller로 진입~~~");
		// token 인증
		String reqeustURL = "https://api.iamport.kr/users/getToken";
		JSONObject json = new JSONObject();
		String imp_key = URLEncoder.encode("0364377215218055","UTF-8");
		String imp_secret = URLEncoder.encode("ff08558eef6ca8c2a09b0d6be51e5daddd5ceb82b9a994a447efbe7d31888a92d0b060c660ae196b","UTF-8");
		json.put("imp_key", imp_key);
		json.put("imp_secret", imp_secret);
		Logger.info("Controller::json::"+json);
		String token = IamportApi.getToken(json, reqeustURL);
		
	}
	
	// 05 결제 완료 후 배송 정보 저장
	@RequestMapping(value="/payEnd.do", method=RequestMethod.POST)
	@ResponseBody
	public int PayEnd(@RequestBody Order order) throws Exception{
		Logger.info("PayEnd Controller 진입::order::"+order);
		int result = service.payEnd(order);
		Logger.info("result:::"+result);
		if(result == 1) {
			Logger.info("db 저장 완료~~");
		}
		else {
			Logger.info("db 저장 실패ㅜㅜㅜㅜㅜ");
		}
		return result;
	}
	
	// 06 결제 완료 페이지 이동
	@RequestMapping(value="/shopEnd.do", method=RequestMethod.GET) 
	public ModelAndView ShopEnd(String orderUid, int snackNo) {
		ModelAndView mv = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orderUid", orderUid);
		map.put("snackNo", snackNo);		
		Logger.info("map:::"+map);
		Order order = service.shopEnd(map);
		mv.addObject(order);
		Logger.info("order::"+order);
		mv.setViewName("shop/shopEnd");
		return mv;
	}
	
	// 07 payment 페이지에서 주문자 동일할 경우 이름, 휴대번호 가져오기
	@RequestMapping(value="/userSame.do", method=RequestMethod.POST)
	@ResponseBody
	public Member userSame(@RequestBody String userEmail) {
		Member member = service.userSame(userEmail);
		return member;
	}
	
}

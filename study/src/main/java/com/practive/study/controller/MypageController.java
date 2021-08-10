package com.practive.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {

	// 01 마이페이지 이동
	@RequestMapping(value="/mypage.do", method = RequestMethod.GET) 
	public String mypage() {
		return "/mypage/mypage";
	}
	
	// 02 채팅화면 이동
	@RequestMapping(value="/chat.do", method = RequestMethod.GET) 
	public String chat() {
		return "/mypage/chat";
	}
}

package com.practive.study.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberJoinController {

	private static final Logger Logger = LoggerFactory.getLogger(MemberJoinController.class);
	
	//회원가입 화면 get
	@RequestMapping(value = "/member/join.do", method = RequestMethod.GET)
	public String join() {
		Logger.info("회원가입 페이지 진입");
		return "/member/join";
	}
	
	
}

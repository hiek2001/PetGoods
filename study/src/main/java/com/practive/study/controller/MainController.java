package com.practive.study.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	//로그를 남기기 위한 것
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	//메인 GET 공통
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main() {
		logger.info("메인 페이지 진입");
		System.out.println("메인 페이지 왜 안떠:::::::::::쉬펄:::::::");
		return "index";
	}
}

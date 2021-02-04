package com.practive.study.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.practive.study.model.service.MemberEndService;
import com.practive.study.model.vo.Member;

@Controller // 현재의 클래스를 controller bean에 등록시킴
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);
	
	// MemberService 객체를 스프링에서 생성하여 주입 (Autowried : Spring에 의존 / Inject : Javax에 의존)
	@Autowired
	private MemberEndService service;
	
	// 01 회원가입 페이지로 이동
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join() {
		Logger.info("회원가입 페이지 진입");
		return "/member/join";
	}
	
	// 02 회원가입 등록
	@RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
	public ModelAndView joinEnd(Member member) throws Exception{
				
		// 팝업 띄우기
		ModelAndView mv=new ModelAndView();
		
		System.out.println("1) Controller입니댯!!!!!!!!");		
		int result=service.insertMember(member);
		
		String msg = "";
		String loc = "";
		String status = "";
		
		if(result>0) { 
			msg="가입이 성공적으로 완료되었습니다.";
			loc="/main.do";
			status="Success";
		}
		else {
			msg="가입이 실패하였습니다. <br> 관리자에게 문의해보세요.";
			status="Fail";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.addObject("status",status);
		mv.setViewName("common/msg");
		return mv;
	}
}

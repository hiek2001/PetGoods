package com.practive.study.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// 비밀번호 암호화를 위해 필요한 것
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	// 01 회원가입 페이지로 이동
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join() {
		Logger.info("회원가입 페이지 진입");
		return "/member/join";
	}
	
	// 02 회원가입 등록
	// @RequestBody를 명시해주지 않는 파라미터는 get 방식으로 데이터를 바인딩하기 때문에 null이 들어감.
	@ResponseBody
	@RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
	public int insertMember(@RequestBody Member member, HttpServletRequest request) throws Exception{
		Logger.info("insertMember() 진입");	
		// 비밀번호 암호화
		String pwdBycrypt = pwdEncoder.encode(member.getUserPw());
		member.setUserPw(pwdBycrypt);
		
		int result=service.insertMember(member);
		System.out.println("Controller에서 result 값 확인::::::"+result);
		
		return result;
	}
	
	// 03 아이디 중복
	// ResponseBody : Form Data가 아닌 JSON 형식의 데이터를 가진 요청이 들어왔을 경우, Handler method는 setter없는 클래스의 객체로 만들어줌
	// RequestParam : json의 key 값 형태로 받음
	@ResponseBody
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public int idCheck(@RequestBody String userId, HttpServletRequest request) throws Exception{
		System.out.println("userId:::"+ userId);
		Logger.info("idCheck() 진입");
		int result = service.userIdCheck(userId);
		System.out.println("result::::"+result);		
		return result;
	}
}

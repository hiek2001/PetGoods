package com.practive.study.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
public class MemberController {

	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);
	
	// MemberService 객체를 스프링에서 생성하여 주입 (Autowried : Spring에 의존 / Inject : Javax에 의존)
	@Autowired
	private MemberEndService service;
	
	// 비밀번호 암호화를 위해 필요한 것
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	// 01 회원가입 / 로그인 페이지로 이동
	@RequestMapping(value = "/member.do", method = RequestMethod.GET)
	public String join() {
		Logger.info("회원가입 페이지 진입");
		return "/member/member";
	}
	
	// 02 회원가입 등록
	// @RequestBody를 명시해주지 않는 파라미터는 get 방식으로 데이터를 바인딩하기 때문에 null이 들어감.
	@ResponseBody
	@RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
	public String insertMember(@RequestBody Member member, HttpServletRequest request) throws Exception{
		Logger.info("insertMember() 진입");	
		// 비밀번호 암호화
		String pwdBycrypt = pwdEncoder.encode(member.getUserPw());
		member.setUserPw(pwdBycrypt);
		
		int result=service.insertMember(member);
		System.out.println("Controller에서 result 값 확인::::::"+result);
		
		// alert 띄우기
		String resultMsg="";
		if(result > 0) {
			resultMsg="<script>alert('회원가입이 완료되었습니다! 로그인해주세요!');</script>";
		}
		else {
			resultMsg="<script>alert('회원가입이 실패하였습니다. 관리자에게 문의해주세요!');</script>";
		}
		return resultMsg;
	}
	
	// 03 로그인 페이지로 이동
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		Logger.info("로그인 페이지 진입");
		return "/member/login";
	}
	
	// 04 로그인 확인
	@ResponseBody
	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST) 
	public int loginCheck(@RequestBody Member member, HttpServletRequest request) throws Exception{
		System.out.println("값 넘어왔는지 확인 :::::"+member);
		Logger.info("loginEnd() 진입");
		int result = service.loginCheck(member);
		System.out.println("result::::::"+result);
		return result;
	}
	
}

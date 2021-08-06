package com.practive.study.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
	public String insertMember(Member member){
		Logger.info("insertMember() 진입");		
		
		// 비밀번호 암호화
		String pwdBycrypt = pwdEncoder.encode(member.getUserPw());
		member.setUserPw(pwdBycrypt);
		
		int result=service.insertMember(member);
		
		return "redirect:/";
	}
		
	// 03 로그인 확인
	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST) 
	public String loginCheck(Member member, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		Logger.info("loginCheck() 진입");
		HttpSession session = request.getSession();
		// 암호화된 비밀번호 가져오기
		String pw = service.loginPw(member.getUserEmail());
		// 암호 비밀번호와 입력된 password 비교
		boolean result = pwdEncoder.matches(member.getUserPw(), pw);
		Member login = new Member();
		if(result==true) {
			member.setUserPw(pw);
			login = service.loginCheck(member);
		}
		else {
			login = service.loginCheck(member);
		}
		// 로그인 	
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}
		else {
			session.setAttribute("member", login);
		}
		return "redirect:/";
	}
	
	// 04 로그아웃
		@RequestMapping(value="/logout.do", method = RequestMethod.GET)
		public String logout(HttpServletRequest request) throws Exception {
			Logger.info("logout() 메소드 진입");
			HttpSession session = request.getSession();
			session.invalidate();
			Logger.info("logout 완료");
			return "redirect:/";
			
		}
}

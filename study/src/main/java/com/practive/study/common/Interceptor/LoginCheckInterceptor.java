package com.practive.study.common.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.practive.study.model.vo.Member;


public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger Logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	// controller가 호출되기 전에 실행되는 메소드 : 현재 사용자가 로그인한 상태인지 확인
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Member member = null;
		member = (Member) request.getSession().getAttribute("member");

		Logger.info("LoginCheckInterceptor 으로 들어왔는지 확인");
		Logger.info("현재 session"+member);
		if(member != null) {
			// 로그인한 사용자일 경우 Controller 호출
			return true;
		}
		else {
			Logger.info("현재 로그인하지 않은 상태입니다.");
			// 로그인하지 않은 사용자일 경우 로그인 페이지로 이동
			response.sendRedirect("/member.do");
			return false;
		}	
	}

}

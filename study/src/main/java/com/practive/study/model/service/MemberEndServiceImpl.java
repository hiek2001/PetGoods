package com.practive.study.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.practive.study.model.dao.MemberEndDao;
import com.practive.study.model.vo.Member;

@Service
public class MemberEndServiceImpl implements MemberEndService {
	
	@Autowired
	private MemberEndDao dao;
	
	// DB 연동
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 01) 회원가입
	@Override
	public int insertMember(Member member) {
		return dao.insertMember(sqlSession,member);
	}
	
	// 02) 로그인
	@Override
	public Member loginCheck(Member member) {
		return dao.loginCheck(sqlSession,member);
	}
	
	// 03) 암호화된 비밀번호 db에서 가져오기
	@Override
	public String loginPw(String userEmail) {
		return dao.loginPw(sqlSession, userEmail);
	}
}

package com.practive.study.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.practive.study.dao.MemberEndDao;
import com.practive.study.model.vo.Member;

@Service
public class MemberEndServiceImpl implements MemberEndService {
	
	@Autowired
	private MemberEndDao dao;
	
	// DB 연동
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int joinEnd(Member member) {
		int result=0;
		result=dao.joinEnd(sqlSession,member);
		ModelAndView mv=new ModelAndView();
		System.out.println("2) Service입니댯!!!!!!!!");
		return result;
	}

}

package com.practive.study.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.practive.study.model.vo.Member;

@Repository
public class MemberEndDaoImpl implements MemberEndDao {
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	// 회원가입 등록
	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member member){	
		return sqlSession.insert("member.insertMember", member);
	}
	
	// 로그인 값 확인
	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("member.loginCheck", member);
	}
	
	// 암호화된 비밀번호 확인
	@Override
	public String loginPw(SqlSessionTemplate sqlSession, String userEmail) {
		return sqlSession.selectOne("member.loginPw", userEmail);
	}
}

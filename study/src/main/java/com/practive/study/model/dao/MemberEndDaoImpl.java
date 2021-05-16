package com.practive.study.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.practive.study.model.vo.Member;

@Repository
public class MemberEndDaoImpl implements MemberEndDao {

	// 회원가입 등록
	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member member){
		System.out.println("3) DAO입니댯!!!!!!!!");
		System.out.println("Member::::"+member);
		return sqlSession.insert("member.insertMember", member);
	}

	// 아이디 중복 체크
	@Override
	public int userIdCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("member.userIdCheck", userId);
	}
	
	// 로그인 값 확인
	@Override
	public int loginCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("member.loginCheck", userId);
	}
}

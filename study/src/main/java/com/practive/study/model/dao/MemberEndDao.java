package com.practive.study.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.practive.study.model.vo.Member;

public interface MemberEndDao {

	/*회원가입 등록*/
	int insertMember(SqlSessionTemplate sqlSession, Member member);
	
	int userIdCheck(SqlSessionTemplate sqlSession, String userId);
	
	int loginCheck(SqlSessionTemplate sqlSession, String userId);
}

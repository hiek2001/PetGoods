package com.practive.study.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.practive.study.model.vo.Member;

public interface MemberEndDao {

	/*회원가입 등록*/
	int joinEnd(SqlSessionTemplate sqlSession, Member member);
}

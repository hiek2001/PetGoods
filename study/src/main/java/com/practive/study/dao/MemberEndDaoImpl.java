package com.practive.study.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.practive.study.model.vo.Member;

@Repository
public class MemberEndDaoImpl implements MemberEndDao {

	// 회원가입 등록
	@Override
	public int joinEnd(SqlSessionTemplate sqlSession, Member member) {
		System.out.println("3) DAO입니댯!!!!!!!!");
		return sqlSession.insert("member.joinEnd",member);
	}

}

package com.practive.study.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.practive.study.model.vo.Chat;

public interface ChatDao {

	int insertChat(SqlSessionTemplate sqlSession, Chat chat);
}

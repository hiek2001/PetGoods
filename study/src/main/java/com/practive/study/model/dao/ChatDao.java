package com.practive.study.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.practive.study.model.vo.Chat;

public interface ChatDao {

	int insertChat(SqlSessionTemplate sqlSession, Chat chat);
	
	List<Chat> messageList(SqlSessionTemplate sqlSession, String userEmail);
}

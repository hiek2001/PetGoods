package com.practive.study.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.practive.study.model.vo.Chat;

@Repository
public class ChatDaoImpl implements ChatDao{
	
	@Override
	public int insertChat(SqlSessionTemplate sqlSession, Chat chat) {
		System.out.println("3) Dao 지난다아아아아~~");
		return sqlSession.insert("chat.insertChat", chat);
	}
	
	@Override
	public List<Chat> messageList(SqlSessionTemplate sqlSession, String userEmail) {
		return sqlSession.selectList("chat.messageList");
	}

}

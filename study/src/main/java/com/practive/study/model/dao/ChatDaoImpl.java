package com.practive.study.model.dao;

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

}

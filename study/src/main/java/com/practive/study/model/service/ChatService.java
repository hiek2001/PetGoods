package com.practive.study.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.practive.study.model.dao.ChatDao;
import com.practive.study.model.vo.Chat;

@Service
public class ChatService {

	@Autowired
	private ChatDao dao;
	
	// DB 연동
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// message 보내기
	public int insertChat(Chat chat) {
		System.out.println("2) Service 지난다아아아아~~");
		return dao.insertChat(sqlSession, chat);
	}
	
	public List<Chat> messageList(String userEmail) {
		return dao.messageList(sqlSession, userEmail);
	}
		
}

package com.practive.study;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.practive.study.controller.MemberController;
import com.practive.study.model.service.ChatService;
import com.practive.study.model.vo.Chat;

@RequestMapping("/websocket")
public class websocketHandler extends TextWebSocketHandler{
	// 웹 소켓 세션을 저장할 리스트 생성
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);
	
	private static final ObjectMapper objectMapper = new ObjectMapper();
	
	@Autowired
	public ChatService service;

	// 01) 클라이언트가 연결 되었을 때 설정
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		Logger.info("{ } 연결됨",session.getId());
	}
	
	// 02) 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// 전달받은 메세지
		String mssg = message.getPayload();
		Logger.info("{} 번호, {} 받음", session.getId(), message.getPayload());
		// json -> java		
		Chat chat = objectMapper.readValue(mssg, Chat.class);
		
		Logger.info("Controller::"+chat);
		// 해당 채팅방에 session에 뿌려줌
		for(WebSocketSession sess : sessionList) {
			TextMessage msg = new TextMessage(message.getPayload());
			sess.sendMessage(msg);
		}
		
		int result = service.insertChat(chat);
		
		if(result == -1)
			Logger.info("메세지 전송 및 db 저장 성공");
		else
			Logger.info("메시지 전송 실패!!! db 저장 실패!!!!");
	}
	
	// 03) 클라이언트 연결을 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		Logger.info("{} 연결 끊김", session.getId());
	}
}

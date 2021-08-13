package com.practive.study.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.practive.study.model.service.ChatService;
import com.practive.study.model.vo.Chat;

@Controller
public class ChatController {
	
	@Autowired
	public ChatService service;

	@RequestMapping(value="/messageList.do")
	public void messageList(String userEmail, HttpServletResponse response) throws Exception{
		
		Gson gson = new GsonBuilder().create();
		// messagelist 가져오기		
		List<Chat> list = service.messageList(userEmail);
		response.setContentType("applicaion/json; charset=UTF-8");
		System.out.println(list);
		// json 문자열로 변환
		gson.toJson(list, response.getWriter());
	}
}

package com.practive.study.model.vo;

import java.sql.Date;

public class Chat {

	private int chatNo;
	private int roomNo;
	private String userEmail;
	private String message;
	private Date chatDate;
	private String userName;
	
	public Chat() {}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	
	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getChatDate() {
		return chatDate;
	}

	public void setChatDate(Date chatDate) {
		this.chatDate = chatDate;
	}

	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", roomNo=" + roomNo + ", userEmail=" + userEmail + ", message=" + message
				+ ", chatDate=" + chatDate + ", userName=" + userName + "]";
	}

	

}

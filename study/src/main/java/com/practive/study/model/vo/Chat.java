package com.practive.study.model.vo;

import java.sql.Date;

public class Chat {

	private int chatNo;
	private String userEmail;
	private String message;
	private Date chatDate;
	
	public Chat() {}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
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

	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", userEmail=" + userEmail + ", message=" + message + ", chatDate=" + chatDate
				+ "]";
	}
	
}

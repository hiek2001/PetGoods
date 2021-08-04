package com.practive.study.model.vo;

import java.sql.Date;

public class Member {

	/*회원가입*/
	private String userEmail;
	private String userPw;
	private String userName;
	private String userMail;
	
	public Member() {}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	@Override
	public String toString() {
		return "Member [userEmail=" + userEmail + ", userPw=" + userPw + ", userName=" + userName + ", userMail="
				+ userMail + "]";
	}
	



}

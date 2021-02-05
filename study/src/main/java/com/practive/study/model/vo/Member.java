package com.practive.study.model.vo;

import java.sql.Date;

public class Member {

	/*회원가입*/
	private String userId;
	private String userPw;
	private String userName;
	private Date userBirth;
	private String userMail;
	private String userAddr;
	
	public Member() {}
	
	/*setter*/
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	
	/*getter*/
	public String getUserId() {
		return userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public String getUserName() {
		return userName;
	}

	public Date getUserBirth() {
		return userBirth;
	}

	public String getUserMail() {
		return userMail;
	}

	public String getUserAddr() {
		return userAddr;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userBirth=" + userBirth
				+ ", userMail=" + userMail + ", userAddr=" + userAddr + "]";
	}

}

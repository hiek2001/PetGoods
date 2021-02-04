package com.practive.study.model.vo;

import java.sql.Date;

public class Member {

	/*회원가입*/
	private String user_id;
	private String user_pw;
	private String user_name;
	private Date user_birth;
	private String user_mail;
	private String user_addr;
	
	public Member() {}
	
	/*setter*/
	public Member(String user_id, String user_pw, String user_name, Date user_birth, String user_mail, String user_addr) {
		super();
		this.user_id=user_id;
		this.user_pw=user_pw;
		this.user_name=user_name;
		this.user_birth=user_birth;
		this.user_mail=user_mail;
		this.user_addr=user_addr;
	
	}
	
	/*getter*/
	public String getUser_id() {
		return user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public Date getUser_birth() {
		return user_birth;
	}

	public String getUser_mail() {
		return user_mail;
	}

	public String getUser_addr() {
		return user_addr;
	}
	
	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_birth=" + user_birth + ", user_mail=" + user_mail
				+", user_addr=" + user_addr + "]";
	}

}

package com.practive.study.model.vo;

public class Member {

	/*회원가입*/
	private String userEmail;
	private String userPw;
	private String userName;
	private String userPhone;
	private String platformType;
	
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
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getPlatformType() {
		return platformType;
	}
	public void setPlatformType(String platformType) {
		this.platformType = platformType;
	}


	@Override
	public String toString() {
		return "Member [userEmail=" + userEmail + ", userPw=" + userPw + ", userName=" + userName + ", userPhone="
				+ userPhone + ", platformType=" + platformType + "]";
	}
	

}

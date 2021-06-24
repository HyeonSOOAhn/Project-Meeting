package com.project.dto;

public class UserDTO {
	
	private int userNum;
	private String userId;
	private String userPwd;
	private String name;
	private int gender;
	private String email;
	private String tel;
	private int right;
	
	//파일 업로드
	private String uoriginalFileName;
	private String ustoredFileName;
	
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getRight() {
		return right;
	}
	public void setRight(int right) {
		this.right = right;
	}
	public String getUoriginalFileName() {
		return uoriginalFileName;
	}
	public void setUoriginalFileName(String uoriginalFileName) {
		this.uoriginalFileName = uoriginalFileName;
	}
	public String getUstoredFileName() {
		return ustoredFileName;
	}
	public void setUstoredFileName(String ustoredFileName) {
		this.ustoredFileName = ustoredFileName;
	}
	
}

package com.project.dto;

public class UserInfo {

	private String userId;
	private String userName;
	private String ustoredFileName;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUstoredFileName() {
		return ustoredFileName;
	}

	public void setUstoredFileName(String ustoredFileName) {
		this.ustoredFileName = ustoredFileName;
	}

}

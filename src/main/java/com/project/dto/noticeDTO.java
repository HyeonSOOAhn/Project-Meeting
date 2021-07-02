package com.project.dto;

public class noticeDTO {
	
	private int noticeNum;
	private String sender;
	private String recipient;
	private String noticeMsg;
	private String created;
	
	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getNoticeMsg() {
		return noticeMsg;
	}
	public void setNoticeMsg(String noticeMsg) {
		this.noticeMsg = noticeMsg;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}

}

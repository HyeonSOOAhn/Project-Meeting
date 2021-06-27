package com.project.dto;

public class TeeingCommentDTO {
	
	private int listNum;
	
	private int commentNum;
	private int teeingNum;
	private String userId;
	private String name;
	private String comment;
	private String created;
	
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public int getTeeingNum() {
		return teeingNum;
	}
	public void setTeeingNum(int teeingNum) {
		this.teeingNum = teeingNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	
}

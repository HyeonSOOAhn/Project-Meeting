package com.project.dto;

public class TingCommentDTO {
	
	private int listNum;
	
	private int commentNum;
	private int tingNum;
	private String tcuserId;
	private String tcname;
	private String comments;
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
	public int getTingNum() {
		return tingNum;
	}
	public void setTingNum(int tingNum) {
		this.tingNum = tingNum;
	}
	public String getTcuserId() {
		return tcuserId;
	}
	public void setTcuserId(String tcuserId) {
		this.tcuserId = tcuserId;
	}
	public String getTcname() {
		return tcname;
	}
	public void setTcname(String tcname) {
		this.tcname = tcname;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	
}

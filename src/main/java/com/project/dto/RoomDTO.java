package com.project.dto;

public class RoomDTO {
	
	private int roomNum;
	private String subject;
	private String title;
	private String keyword;
	private String introduce;
	private String created;
	
	private int totalP;
	private int totalPDirect;
	private int currentP;
	
	private String manager;
	
	//파일 업로드
	private String originalFileName;
	private String storedFileName;
	
	
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getTotalP() {
		return totalP;
	}
	public void setTotalP(int totalP) {
		this.totalP = totalP;
	}
	public int getTotalPDirect() {
		return totalPDirect;
	}
	public void setTotalPDirect(int totalPDirect) {
		this.totalPDirect = totalPDirect;
	}
	public int getCurrentP() {
		return currentP;
	}
	public void setCurrentP(int currentP) {
		this.currentP = currentP;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}
	
}

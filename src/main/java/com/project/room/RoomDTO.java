package com.project.room;

public class RoomDTO {
	
	private int roomNum;
	private String subject;
	private String title;
	private String keyword;
	private String introduce;
	private String created;
	
	private int totalP;
	private int currentP;
	
	private int manager;
	
	//파일 업로드
	private int fileNum;
	private String originalFileName;
	private String storedFileName;
	private int fileSize;
	private String DEL_GB;
	
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
	public int getCurrentP() {
		return currentP;
	}
	public void setCurrentP(int currentP) {
		this.currentP = currentP;
	}
	public int getManager() {
		return manager;
	}
	public void setManager(int manager) {
		this.manager = manager;
	}
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
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
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getDEL_GB() {
		return DEL_GB;
	}
	public void setDEL_GB(String dEL_GB) {
		DEL_GB = dEL_GB;
	}
	
}

package com.project.dto;

public class RoomInfoDTO {
	
	private int roomNum; // 방 고유 번호
	
	private int boardNum; // 게시판 번호
	private String userId; // 아이디
	private String boardName; // 이름
	private String boardTitle; // 제목
	private String boardContent; // 내용
	private int groupNum;
	private int depth;
	private int orderNum;
	private int parent;
	private String selectDay;
	private String adst;
	private String mode1;
	
	private String subject; // 방 대분류
	private String keyword; // 방 키워드
	private String manager; // 방장
	private String title; // 방 제목
	private String introduce; // 방 소개글
	private String backgroundImage; // 방 배경사진
	private int totalP; // 총 입장 가능 인원
	private int currentP; // 현재 입장 인원
	private String created; // 만들어진 날짜
	
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getSelectDay() {
		return selectDay;
	}
	public void setSelectDay(String selectDay) {
		this.selectDay = selectDay;
	}
	public String getAdst() {
		return adst;
	}
	public void setAdst(String adst) {
		this.adst = adst;
	}
	public String getMode1() {
		return mode1;
	}
	public void setMode(String mode1) {
		this.mode1 = mode1;
	}
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getBackgroundImage() {
		return backgroundImage;
	}
	public void setBackgroundImage(String backgroundImage) {
		this.backgroundImage = backgroundImage;
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
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
}
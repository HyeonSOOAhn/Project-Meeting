package com.project.dto;

public class RoomInfoDTO {
	
	private int roomNum; // 방 고유 번호
	
	private int boardNum; // 게시판 번호
	private String userId; // 아이디
	private String boardTitle; // 제목
	private String boardContent; // 내용
	private String selectDay;
	private String adst;
	private String mode1;
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
	public void setMode1(String mode1) {
		this.mode1 = mode1;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
}
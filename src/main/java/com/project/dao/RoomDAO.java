package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.project.dto.RoomDTO;

public class RoomDAO {
	
private SqlSessionTemplate sessionTemplate;
	
	//의존성 주입
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		
		this.sessionTemplate = sessionTemplate;
		
	}
	
	//전체 방 --------------------------------------------------------------
	//입력
	public void insertData(Map<String,Object> map) {
		
		sessionTemplate.insert("com.roomMapper.insertData", map);
		
	}
	
	/*
	//파일 입력
	public void insertFile(Map<String,Object> map) {
		
		sessionTemplate.insert("com.roomMapper.insertFile", map);
		
	}
	
	//파일 출력
	public List<Map<String,Object>> selectFileList(int roomNum) {
		
		List<Map<String,Object>> lists = sessionTemplate.selectList("com.roomMapper.selectFileList",roomNum);
		
		return lists;
		
	}
	*/
	
	//전체 데이터 개수
	public int getDataCount(String searchKey,String searchValue) {
		
		int totalDataCount = 0;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		totalDataCount = sessionTemplate.selectOne("com.roomMapper.getDataCount", params);
		
		return totalDataCount;
		
	}
	
	//표시할 페이지 (rownum 범위) 데이터
	public List<RoomDTO> getLists(int start,int end,String searchKey,String searchValue) {//페이징할 번호의 시작과 끝
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		List<RoomDTO> lists = sessionTemplate.selectList("com.roomMapper.getLists", params);
			
		return lists;
			
	}
	
	//roomNum으로 조회한 한 개의 데이터
	public RoomDTO getReadData(int roomNum) {
		
		RoomDTO dto = sessionTemplate.selectOne("com.roomMapper.getReadData", roomNum);
		
		return dto;
		
	}
	
	//수정
	public void updateData (Map<String,Object> map) {
		
		sessionTemplate.update("com.roomMapper.updateData", map);
		
	}
	
	//삭제
	public void deleteData(int roomNum) {
		
		sessionTemplate.delete("com.roomMapper.deleteData", roomNum);
		
	}
	
	
	//여행 방 --------------------------------------------------------------
	public int travelDataCount(String searchKey,String searchValue) {
		
		int totalDataCount = 0;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		totalDataCount = sessionTemplate.selectOne("com.roomMapper.travelDataCount", params);
		
		return totalDataCount;
		
	}
	
	public List<RoomDTO> travelGetLists(int start,int end,String searchKey,String searchValue) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		List<RoomDTO> lists = sessionTemplate.selectList("com.roomMapper.travelGetLists", params);
			
		return lists;
			
	}
	
	
	//맛집 방 --------------------------------------------------------------
	public int foodDataCount(String searchKey,String searchValue) {
		
		int totalDataCount = 0;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		totalDataCount = sessionTemplate.selectOne("com.roomMapper.foodDataCount", params);
		
		return totalDataCount;
		
	}
	
	public List<RoomDTO> foodGetLists(int start,int end,String searchKey,String searchValue) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		List<RoomDTO> lists = sessionTemplate.selectList("com.roomMapper.foodGetLists", params);
			
		return lists;
			
	}
	
	
	//운동 방 --------------------------------------------------------------
	public int sportsDataCount(String searchKey,String searchValue) {
		
		int totalDataCount = 0;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		totalDataCount = sessionTemplate.selectOne("com.roomMapper.sportsDataCount", params);
		
		return totalDataCount;
		
	}
	
	public List<RoomDTO> sportsGetLists(int start,int end,String searchKey,String searchValue) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		List<RoomDTO> lists = sessionTemplate.selectList("com.roomMapper.sportsGetLists", params);
			
		return lists;
			
	}
	
	
	//운동 방 --------------------------------------------------------------
	public int studyDataCount(String searchKey,String searchValue) {
		
		int totalDataCount = 0;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		totalDataCount = sessionTemplate.selectOne("com.roomMapper.studyDataCount", params);
		
		return totalDataCount;
		
	}
	
	public List<RoomDTO> studyGetLists(int start,int end,String searchKey,String searchValue) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		List<RoomDTO> lists = sessionTemplate.selectList("com.roomMapper.studyGetLists", params);
			
		return lists;
			
	}

}

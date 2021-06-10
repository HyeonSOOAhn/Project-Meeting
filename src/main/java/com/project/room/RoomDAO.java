package com.project.room;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class RoomDAO {
	
private SqlSessionTemplate sessionTemplate;
	
	//의존성 주입
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		
		this.sessionTemplate = sessionTemplate;
		
	}
	
	//입력
	public void insertData(RoomDTO dto) {
		
		sessionTemplate.insert("com.roomMapper.insertData", dto);
		
	}
	
	//파일 입력
	public void insertFile(Map<String,Object> map) {
		
		sessionTemplate.insert("com.roomMapper.insertFile", map);
		
	}
	
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
	
	public RoomDTO getReadData(int num) {
		
		RoomDTO dto = sessionTemplate.selectOne("com.roomMapper.getReadData", num);
		
		return dto;
		
	}

}

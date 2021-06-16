package com.project.roomInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class RoomInfoDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

//	방 리스트 가져오기
	public List<RoomInfoDTO> getRoomList(String subject, String keyword, int start, int end) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("subject", subject);
		map.put("keyword", keyword);
		
		List<RoomInfoDTO> lists = sessionTemplate.selectList("project.RoomInfoMapper.getRoomList", map);
		
		return lists;
	}
	
//	해당 방의 정보 가져오기
	public List<RoomInfoDTO> getRoomData(int roomNum) {
		
		List<RoomInfoDTO> lists = sessionTemplate.selectList("project.RoomInfoMapper.getRoomData", roomNum);
		
		return lists;
	}
	
//	방 내부 게시물 가져오기
	public List<RoomInfoDTO> getBoardList(int roomNum) {
		
		List<RoomInfoDTO> lists = sessionTemplate.selectList("project.RoomInfoMapper.getBoardList", roomNum);
		
		return lists;
	}
	
//	테스트용
	public List<TestDTO> getTest(String name) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		
		String[] array = name.split("\\s");
		
		for(int i=0; i<array.length; i++) {
			list.add(array[i]);
		}
		
		map.put("list", list);
		
		List<TestDTO> lists = sessionTemplate.selectList("project.RoomInfoMapper.getTest", map);
		
		return lists;
	}
}
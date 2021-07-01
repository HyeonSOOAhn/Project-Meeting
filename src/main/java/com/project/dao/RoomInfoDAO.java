package com.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.project.dto.RoomDTO;
import com.project.dto.RoomInfoDTO;
import com.project.roomInfo.TestDTO;

public class RoomInfoDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

//	추가
	public void insertRoomBoard(RoomInfoDTO dto) {
		
		sessionTemplate.insert("project.RoomInfoMapper.insertRoomBoard", dto);
	}
	
//	출력
	public List<RoomInfoDTO> getAllBoard(int roomNum) {
		
		List<RoomInfoDTO> lists = sessionTemplate.selectList("project.RoomInfoMapper.getAllBoard", roomNum);
		
		return lists;
	}
	
	public List<RoomInfoDTO> getSoltBoard(int roomNum, String mode1) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roomNum", roomNum);
		map.put("mode1", mode1);
		
		List<RoomInfoDTO> lists = sessionTemplate.selectList("project.RoomInfoMapper.getSoltBoard", map);
		
		return lists;
	}
	
	public int getMaxBoardNum() {
		
		return sessionTemplate.selectOne("project.RoomInfoMapper.getMaxBoardNum");
	}
	
	public RoomInfoDTO getBoardData(int boardNum) {
		
		RoomInfoDTO dto = sessionTemplate.selectOne("project.RoomInfoMapper.getBoardData", boardNum);
		
		return dto;
	}
	
	public RoomDTO getRoomData(int roomNum) {

		RoomDTO dto = sessionTemplate.selectOne("project.RoomInfoMapper.getRoomData", roomNum);
		
		return dto;
	}
	
//	삭제
	public void deleteRoomBoard(int roomNum) {
		
		sessionTemplate.delete("project.RoomInfoMapper.deleteRoomBoard", roomNum);
	}
	
	public void deleteOne(int boardNum) {
		
		sessionTemplate.delete("project.RoomInfoMapper.deleteOne", boardNum);
	}
	
	public void deleteRoomForId(String userId) {
		
		sessionTemplate.delete("project.RoomInfoMapper.deleteRoomForId", userId);
	}
	
//	수정
	public void updateData(RoomInfoDTO dto) {
		
		sessionTemplate.update("project.RoomInfoMapper.updateData", dto);
	}
	
//	-------------------
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
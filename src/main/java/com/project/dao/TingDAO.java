package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.project.dto.TingDTO;

public class TingDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	//의존성 주입
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		
		this.sessionTemplate = sessionTemplate;
		
	}
	
	public void insertTingData(TingDTO dto) {
		
		sessionTemplate.insert("com.tingMapper.insertTingData", dto);
		
	}
	
	public int tingDataCount(String searchKey,String searchValue,int roomNum) {
		
		int totalDataCount = 0;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		params.put("roomNum", roomNum);
		
		totalDataCount = sessionTemplate.selectOne("com.tingMapper.tingDataCount", params);
		
		return totalDataCount;
		
	}
	
	public List<TingDTO> getTingLists(int start,int end,int roomNum,String searchKey,String searchValue) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("roomNum", roomNum);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		List<TingDTO> lists = sessionTemplate.selectList("com.tingMapper.getTingLists", params);
		
		return lists;
		
	}
	
	public TingDTO tingReadData (int tingNum,int roomNum) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tingNum", tingNum);
		params.put("roomNum", roomNum);
		
		TingDTO dto = sessionTemplate.selectOne("com.tingMapper.tingReadData", params);
		
		return dto;
		
	}
	
	public void updateTingData (TingDTO dto) {
		
		sessionTemplate.update("com.tingMapper.updateTingData", dto);
		
	}
	
	public void deleteTingData(int tingNum,int roomNum) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("tingNum", tingNum);
		params.put("roomNum", roomNum);
		
		sessionTemplate.delete("com.tingMapper.deleteTingData", params);
		
	}

}

package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.project.dto.TeeingDTO;

public class TeeingDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	//의존성 주입
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		
		this.sessionTemplate = sessionTemplate;
		
	}
	
	public void insertTeeingData(TeeingDTO dto) {
		
		sessionTemplate.insert("com.teeingMapper.insertTeeingData", dto);
		
	}
	
	public int teeingDataCount(String searchKey,String searchValue) {
		
		int totalDataCount = 0;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		totalDataCount = sessionTemplate.selectOne("com.teeingMapper.teeingDataCount", params);
		
		return totalDataCount;
		
	}
	
	public List<TeeingDTO> getTeeingLists(int start,int end,String searchKey,String searchValue) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		List<TeeingDTO> lists = sessionTemplate.selectList("com.teeingMapper.getTeeingLists", params);
		
		return lists;
		
	}
	
	public TeeingDTO teeingReadData (int teeingNum) {
		
		TeeingDTO dto = sessionTemplate.selectOne("com.teeingMapper.teeingReadData", teeingNum);
		
		return dto;
		
	}
	
	public void updateTeeingData (TeeingDTO dto) {
		
		sessionTemplate.update("com.teeingMapper.updateTeeingData", dto);
		
	}
	
	public void deleteTeeingData(int teeingNum) {
		
		sessionTemplate.delete("com.teeingMapper.deleteTeeingData", teeingNum);
		
	}

}

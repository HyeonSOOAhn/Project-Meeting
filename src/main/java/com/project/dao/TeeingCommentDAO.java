package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.project.dto.TeeingCommentDTO;

public class TeeingCommentDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	//의존성 주입
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		
		this.sessionTemplate = sessionTemplate;
		
	}
	
	public void insertTeeingCommentData(TeeingCommentDTO dto) {
		
		sessionTemplate.insert("com.teeingCommentMapper.insertTeeingCommentData", dto);
		
	}
	
	public int teeingCommentDataCount() {
		
		int totalDataCount = 0;
		
		totalDataCount = sessionTemplate.selectOne("com.teeingCommentMapper.teeingCommentDataCount");
		
		return totalDataCount;
		
	}
	
	public List<TeeingCommentDTO> getTeeingCommentLists(int start,int end,String searchKey,String searchValue) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		List<TeeingCommentDTO> lists = sessionTemplate.selectList("com.teeingCommentMapper.getTeeingCommentLists", params);
		
		return lists;
		
	}
	
	public void deleteTeeingCommentData(int commentNum) {
		
		sessionTemplate.delete("com.teeingCommentMapper.deleteTeeingCommentData", commentNum);
		
	}
	
}

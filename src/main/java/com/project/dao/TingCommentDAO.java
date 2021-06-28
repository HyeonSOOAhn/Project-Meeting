package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.project.dto.TingCommentDTO;

public class TingCommentDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	//의존성 주입
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		
		this.sessionTemplate = sessionTemplate;
		
	}
	
	public void insertTingCommentData(TingCommentDTO dto) {
		
		sessionTemplate.insert("com.tingCommentMapper.insertTingCommentData", dto);
		
	}
	
	public int tingCommentDataCount() {
		
		int totalDataCount = 0;
		
		totalDataCount = sessionTemplate.selectOne("com.tingCommentMapper.tingCommentDataCount");
		
		return totalDataCount;
		
	}
	
	public List<TingCommentDTO> getTingCommentLists(int start,int end) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		
		List<TingCommentDTO> lists = sessionTemplate.selectList("com.tingCommentMapper.getTingCommentLists", params);
		
		return lists;
		
	}
	
	public void deleteTingCommentData(int commentNum) {
		
		sessionTemplate.delete("com.tingCommentMapper.deleteTingCommentData", commentNum);
		
	}
	
}

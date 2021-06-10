package com.project.dao;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.project.dto.UserDTO;

public class RegisterDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	Connection conn = null;
	
	public void insertUserData(UserDTO dto) {
		sessionTemplate.insert("com.Mapper.insertUserData",dto);
	}
	public int overlapId(String userId) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId",userId);
		
		return sessionTemplate.selectOne("com.Mapper.overlapId",params);
	}
	public int overlapEmail(String email) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userEmail",email);
		
		return sessionTemplate.selectOne("com.Mapper.overlapEmail",params);
	}

}

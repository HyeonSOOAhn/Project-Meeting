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
	
	public void insertUserData(Map<String,Object> map) {
		sessionTemplate.insert("com.Mapper.insertUserData",map);
	}
	
	public int checkId(String userId) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId",userId);
		
		int result = sessionTemplate.selectOne("com.Mapper.checkId",params);
		
		return result;
		
	}
	
	public int checkEmail(String email) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("email",email);
		
		return sessionTemplate.selectOne("com.Mapper.checkEmail",params);
		
	}
	
	public String checkPwd(String userId) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId",userId);
		
		return sessionTemplate.selectOne("com.Mapper.checkPwd",params);
		
	}
	
	public void resetPwd(String email,String userPwd) {
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("email", email);
		params.put("userPwd", userPwd);
		
		sessionTemplate.update("com.Mapper.resetPwd", params);
		
	}
	
	public UserDTO getUserInfo(String userId) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		
		UserDTO dto = sessionTemplate.selectOne("com.Mapper.getUserInfo", params);
		return dto;
		
	}
	
	public void updateUserData (Map<String,Object> map) {
		
		sessionTemplate.update("com.Mapper.updateUserData", map);
		
	}
	
	public void deleteUserData (String userId) {
		
		sessionTemplate.delete("com.Mapper.deleteUserData", userId);
		
	}

}

package com.project.dao;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.project.dto.RoomDTO;
import com.project.dto.UserDTO;
import com.project.dto.msgDTO;

public class RegisterDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	Connection conn = null;

	public void insertUserData(Map<String, Object> map) {
		sessionTemplate.insert("com.Mapper.insertUserData", map);
	}
	public void insertData(UserDTO dto) {
		sessionTemplate.insert("com.Mapper.insertData",dto);
	}

	public int checkId(String userId) {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);

		int result = sessionTemplate.selectOne("com.Mapper.checkId", params);

		return result;

	}

	public int checkEmail(String email) {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("email", email);
		
		int result = sessionTemplate.selectOne("com.Mapper.checkEmail", params);
		
		return result;

	}

	public String checkPwd(String userId) {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);

		return sessionTemplate.selectOne("com.Mapper.checkPwd", params);

	}

	public void resetPwd(String email, String userPwd) {

		Map<String, Object> params = new HashMap<String, Object>();
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

	
	//myPage
	public void updateProfileImg(Map<String, String> map) {
		sessionTemplate.update("com.Mapper.updateProfileImg",map);
	}
	public void updateUserData(UserDTO dto) {
		sessionTemplate.update("com.Mapper.updateUserData", dto);
	}
	public void deleteUserData(String userId) {
		sessionTemplate.delete("com.Mapper.deleteUserData", userId);
	}
	public List<RoomDTO> getManageList(String manager){
		return sessionTemplate.selectList("com.Mapper.getManageList",manager);
	}
	public List<msgDTO> getRequestList(String sender){
		return sessionTemplate.selectList("com.Mapper.getRequestList",sender);
	}
	public List<RoomDTO> getParticipateList(String userId){
		return sessionTemplate.selectList("com.Mapper.getParticipateList",userId);
	}

}

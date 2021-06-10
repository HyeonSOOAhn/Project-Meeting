package com.project.meeting.reco.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import com.project.meeting.reco.dto.RecoDTO;

public class RecoDAO {
	
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	public List<RecoDTO> getList(String subject) {
		
		List<RecoDTO> lists = 
				sessionTemplate.selectList("com.recoMapper.getLists",subject);
		
		return lists;
	}

}

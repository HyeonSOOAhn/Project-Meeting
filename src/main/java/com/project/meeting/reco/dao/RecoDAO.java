package com.project.meeting.reco.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;

import com.project.meeting.parse.RecoDBStudyParser;
import com.project.meeting.reco.dto.RecoDTO;

public class RecoDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	public List<RecoDTO> getList(String subject) {

		List<RecoDTO> lists = sessionTemplate.selectList("com.recoMapper.getLists", subject);

		return lists;
	}
	
	public void insertData() throws IOException, InterruptedException{

		RecoDBStudyParser.totalCountParser();
		for(int i=1;i<(RecoDBStudyParser.totalCount/100)+2;i++)
		{				
			for(RecoDTO data : RecoDBStudyParser.libParser(i)) {
				sessionTemplate.insert("com.recoMapper.insertData",data);
			
			}
			
		}

	}


}

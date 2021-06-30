package com.project.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.project.dto.RecoDTO;
import com.project.parse.RecoDBSportsParser;
import com.project.parse.RecoDBStudyParser;
import com.project.parse.RecoDBTravelParser;

public class RecoDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	//끝페이지 구하기
	public int getMaxNum(String subject) {
		
		
		int maxNum = sessionTemplate.selectOne("com.recoMapper.getMaxNum",subject);
		
		System.out.println(maxNum);
		maxNum = (maxNum/100)+1;
		
		return maxNum;
	}

	
	//서브젝트별 리스트 가져오기
	public List<RecoDTO> getLists(String subject,int pageNum) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("subject", subject);
		map.put("pageNum",pageNum);
		
		
		List<RecoDTO> lists = sessionTemplate.selectList("com.recoMapper.getLists", map);
		
		return lists;
	}
	
	//데이터 하나 가져오기
	public RecoDTO getReadData(int recoNum){
		
		RecoDTO list = sessionTemplate.selectOne("com.recoMapper.getReadData", recoNum);
		
		return list;
	}
	
	//데이터 업데이트
	public void insertData() throws IOException, InterruptedException{

		RecoDBStudyParser.totalCountParser();
		for(int i=1;i<(RecoDBStudyParser.totalCount/100)+2;i++)
		{				
			for(RecoDTO data : RecoDBStudyParser.libParser(i)) {
				sessionTemplate.insert("com.recoMapper.insertData",data);
			
			}	
		}
		RecoDBTravelParser.totalCountParser();
		for(int i=1;i<(RecoDBTravelParser.totalCount/100)+2;i++)
		{				
			for(RecoDTO data : RecoDBTravelParser.traParser(i)) {
				sessionTemplate.insert("com.recoMapper.insertData",data);
			
			}
		}
		
		RecoDBSportsParser.totalCountParser();
		for(int i=1;i<(RecoDBSportsParser.totalCount/100)+2;i++)
		{				
			for(RecoDTO data : RecoDBSportsParser.spoParser(i)) {
				sessionTemplate.insert("com.recoMapper.insertData",data);
			
			}
		}

	}
	
	


}

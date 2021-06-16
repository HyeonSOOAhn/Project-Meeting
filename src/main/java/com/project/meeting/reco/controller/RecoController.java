package com.project.meeting.reco.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.meeting.parse.RecoDBStudyParser;
import com.project.meeting.reco.dao.RecoDAO;
import com.project.meeting.reco.dto.RecoDTO;

@Controller
public class RecoController {
	
	@Autowired
	@Qualifier("recoDAO")
	RecoDAO dao;
	
	
	@RequestMapping(value = "/reco", method = RequestMethod.GET)
	public String reco(HttpServletRequest request) throws IOException, InterruptedException {
		
		String subject = request.getParameter("subject");
		String mode = request.getParameter("mode");
		
		
		if(mode!=null) {
			
			
			  int pageNo=0; dao.insertData(RecoDBStudyParser.DBLibParser(0));
			  
			  for(pageNo=1;pageNo<(RecoDBStudyParser.totalCount/100)+1;pageNo++){
			  dao.insertData(RecoDBStudyParser.DBLibParser(pageNo)); }
			 
			  System.out.println("업데이트 완료");
		}
		
		
		if(subject!=null) {
			
			List<RecoDTO> lists = dao.getList(subject);
			
			request.setAttribute("subject", subject);
			request.setAttribute("lists", lists);
		}
		

		return "reco";
	}
	
}

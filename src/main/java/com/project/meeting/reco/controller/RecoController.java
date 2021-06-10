package com.project.meeting.reco.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.meeting.reco.dao.RecoDAO;
import com.project.meeting.reco.dto.RecoDTO;

@Controller
public class RecoController {
	
	@Autowired
	@Qualifier("recoDAO")
	RecoDAO dao;
	
	@RequestMapping(value = "/reco", method = RequestMethod.GET)
	public String reco(HttpServletRequest request) {
		
		String subject = request.getParameter("subject");
		
		if(subject!=null) {
			List<RecoDTO> lists = dao.getList(subject);
			
			request.setAttribute("subject", subject);
			request.setAttribute("lists", lists);
		}
		

		return "reco";
	}
	
}

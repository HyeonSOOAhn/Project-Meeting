package com.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dao.RecoDAO;
import com.project.dto.RecoDTO;
import com.project.parse.RecoDBStudyParser;

@Controller
public class RecoController {
	
	@Autowired
	@Qualifier("recoDAO")
	RecoDAO dao;
	
	
	//메인
	@RequestMapping(value = "/reco_main", method = RequestMethod.GET)
	public String reco(Model model) throws IOException, InterruptedException {

		return "reco";
	}
	
	//서브젝트별 리스트 불러오기
	@RequestMapping(value = "/reco", method = RequestMethod.GET)
	public String recoStudy(Model model,
							@RequestParam(value = "searchKey", required = false) String search,
							@RequestParam(value = "subject", required = true) String subject,	
							@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum)
									throws IOException, InterruptedException {
		
		int maxNum = dao.getMaxNum(subject);
		List<RecoDTO> lists = dao.getLists(subject,pageNum);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("maxNum", maxNum);
		model.addAttribute("subject", subject);
		model.addAttribute("lists", lists);
		

		return "reco";
	}
	
	
	//자료 업데이트
	@RequestMapping(value = "/reco_update", method = RequestMethod.GET)
	public String recoUpdate() throws IOException, InterruptedException {
		dao.insertData();

		System.out.println("업데이트 완료");
		
		return "redirect:reco_main";
	}
	
	//하나의 데이터를 불러와서 그 정보와 지도를 호출
	@RequestMapping(value = "/reco_showMap", method = RequestMethod.GET)
	public String showMap(Model model,
						  @RequestParam(value ="recoNum", required = true) int recoNum){
		
		RecoDTO list = dao.getReadData(recoNum);

		model.addAttribute("list", list);

		return "showMap";

	}
	
	@RequestMapping(value = "/reco_around", method = RequestMethod.GET)
	public String around(Model model) {
		
		return "reco";
	}
	
	
	
}

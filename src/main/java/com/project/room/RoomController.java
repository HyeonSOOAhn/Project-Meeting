package com.project.room;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RoomController {
	
	@Autowired
	@Qualifier("roomDAO")
	RoomDAO dao;
	
	@Autowired
	@Qualifier("myUtil")
	MyUtil myUtil;
	
	@Autowired
	@Qualifier("fileUtil")
	FileUtil fileUtil;
	
	@RequestMapping(value = "/index.action")
	public ModelAndView index() throws Exception {
		
		//http://localhost:8080/meeting/index.action
		ModelAndView mav = new ModelAndView();
		mav.setViewName("room/index");
		
		return mav;
		
	}
	
	@RequestMapping(value = "/created.action")
	public ModelAndView created() throws Exception {
		
		//http://localhost:8080/meeting/created.action
		ModelAndView mav = new ModelAndView();
		mav.setViewName("room/created");
		
		return mav;
		
	}
	
	@RequestMapping(value = "/created_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String created_ok(RoomDTO dto,MultipartHttpServletRequest mpRequest) throws Exception {
		
		dao.insertData(dto);
		
		List<Map<String, Object>> lists = fileUtil.parseInsertFileInfo(dto, mpRequest);
		
		int size = lists.size();
		
		for(int i=0;i<size;i++) {
			dao.insertFile(lists.get(i));
		}
		
		return "redirect:/list.action";
		
	}

}

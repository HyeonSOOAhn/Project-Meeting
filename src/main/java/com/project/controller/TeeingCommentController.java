package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.RegisterDAO;
import com.project.dao.TeeingCommentDAO;
import com.project.dto.TeeingCommentDTO;
import com.project.dto.UserDTO;
import com.project.dto.UserInfo;
import com.project.util.PageUtil;

public class TeeingCommentController {
	
	@Autowired
	@Qualifier("teeingCommentDAO")
	TeeingCommentDAO dao;
	
	@Autowired
	RegisterDAO dao2;
	
	@Autowired
	@Qualifier("pageUtil")
	PageUtil pageUtil;
	
	@RequestMapping(value = "/comment.action")
	public ModelAndView comment(TeeingCommentDTO dto,HttpServletRequest request) throws Exception {
		
		//로그인 확인
		HttpSession session = request.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");
		
		if(info == null) {
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("login/login");
			
			return mav;
			
		}
		
		UserDTO dto1 = new UserDTO();
		
		dto1 = dao2.getUserInfo(info.getUserId());
		dto.setUserId(dto1.getUserId());
		dto.setName(dto1.getName());
		
		dao.insertTeeingCommentData(dto);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(""); //리스트로 보내기
		
		return mav;
		
	}
	
}

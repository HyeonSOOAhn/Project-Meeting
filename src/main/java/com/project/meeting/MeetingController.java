package com.project.meeting;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.RegisterDAO;
import com.project.dto.UserDTO;

@Controller
public class MeetingController {
	
	
	
	@Autowired
	RegisterDAO dao;
	
	
	@RequestMapping(value="/register.action",
			method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView register() throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Register");
		
		return mav;
	}
	
	@RequestMapping(value="/register_ok.action", method = RequestMethod.POST)
	public String register_ok(UserDTO dto, HttpServletRequest req) throws Exception{
		
		//값들이 존재하는 값들이 아닌지 구현
		if(dao.overlapId(dto.getUserId()) != 0) {
			req.setAttribute("existId","아이디가 이미 존재합니다." );
			return "Register";
		}
		if(dao.overlapEmail(dto.getEmail()) != 0) {
			req.setAttribute("existEmail","이메일이 이미 존재합니다." );
			return "Register";
		}
		
		dao.insertUserData(dto);
		
		return "redirect:/login.action"; 
	}
	
	@RequestMapping(value="/login.action",
			method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login() throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		
		return mav;
	}
	
	@RequestMapping(value="/login_ok.action",
			method = RequestMethod.POST)
	public String login_ok() {
		
		//아이디 or 이메일 존재하는지 있다면 비밀번호 맞는지 확인하는 거 구현
		
		return "redirect:/main.action";
	}
	
	

}

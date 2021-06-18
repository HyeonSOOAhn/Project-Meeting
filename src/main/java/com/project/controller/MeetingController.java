package com.project.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.RegisterDAO;
import com.project.dto.UserDTO;
import com.project.dto.UserInfo;

@Controller
public class MeetingController {
	
	
	
	@Autowired
	RegisterDAO dao;
	
	@Autowired
	JavaMailSender mailSender;
	
	@RequestMapping(value="/main.action",
			method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView main(HttpServletRequest req) throws Exception{
		
		HttpSession session = req.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");
		
		if(info == null) {
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/login/login");
			
			return mav;
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		
		return mav;
		
	}
	
	@RequestMapping(value="/register.action",
			method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView register() throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/register/Register");
		
		return mav;
	}
	
	@RequestMapping(value="/register_ok.action", method = RequestMethod.POST)
	public String register_ok(UserDTO dto, HttpServletRequest req) throws Exception{
		
		//값들이 존재하는 값들이 아닌지 구현
		if(dao.checkId(dto.getUserId()) != 0) {
			req.setAttribute("existId","아이디가 이미 존재합니다." );
			return "/register/Register";
		}
		if(dao.checkEmail(dto.getEmail()) != 0) {
			req.setAttribute("existEmail","이메일이 이미 존재합니다." );
			return "/register/Register";
		}
		
		dao.insertUserData(dto);
		
		return "redirect:/main.action"; 
	}
	
	@RequestMapping(value="/login.action",
			method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login() throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/login/login");
		
		return mav;
	}
	@RequestMapping(value="/logout.action",
			method = RequestMethod.POST)
	public String logout(HttpServletRequest req) throws Exception{
		
		HttpSession session = req.getSession();
		session.removeAttribute("userInfo");
		
		return "redirect:/main.action";
	}
	
	@RequestMapping(value="/login_ok.action",
			method = RequestMethod.POST)
	public String login_ok(String userId,String userPwd,String rememberBtn, HttpServletRequest req) throws Exception{
		
		//아이디 or 이메일 존재하는지 있다면 비밀번호 맞는지 확인하는 거 구현
		if(dao.checkId(userId) == 0 && dao.checkEmail(userId) == 0) {
			req.setAttribute("noExistInfo","아이디/이메일이나 비밀번호가 틀렸습니다." );
			return "/login/login";
		}
		
		if(!dao.checkPwd(userId).equals(userPwd)) {
			req.setAttribute("noExistInfo","아이디/이메일이나 비밀번호가 틀렸습니다." );
			return "/login/login";
		}
		
		UserDTO dto = new UserDTO();
		
		dto = dao.getUserInfo(userId);
		
		UserInfo info = new UserInfo();
		System.out.println(dto.getUserId());
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getUserName());
		
		HttpSession session = req.getSession();
		
		session.setAttribute("userInfo", info);
		
		session.setMaxInactiveInterval(60*30); //30분
		
		return "redirect:/main.action";
	}
	
	@RequestMapping(value="/forgotPwd.action",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String forgotPwd(String email,String wow,HttpServletRequest req) throws Exception{
		

		try {
			if(wow.equals("1")) {
				req.setAttribute("resetPwd", "resetPwd");
			}
			
		} catch (Exception e) {
			
		}

		req.setAttribute("email", email);
		
		return "/login/forgotPwd";
	}
	
	@RequestMapping(value="/forgotPwd_ok.action",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String forgotPwd_ok(String email, HttpServletRequest req) throws Exception{
		
		if(dao.checkEmail(email) == 0) {
			req.setAttribute("noExistEmail","등록된 이메일이 없습니다." );
			return "/login/forgotPwd";
		}else {
			return "redirect:/sendEmail.action?email=" + email;
		}
				
	}
	@RequestMapping(value="/sendEmail.action",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String sendEmail(String email,String wow, HttpServletRequest req) throws Exception{
		
		System.out.println(req.getServerPort());
		
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
			
			mailHelper.setFrom("Meeting");
			mailHelper.setTo(email);
			mailHelper.setSubject("Meeting비밀번호 초기화 메일입니다.");
			mailHelper.setText("http://localhost:"+ req.getServerPort() +"/meeting/forgotPwd.action?email=" + email +"&wow=1",true);
			
			mailSender.send(mail);
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		req.setAttribute("sendedEmail","등록된 이메일주소로 메일을 보냈습니다. 확인해 주세요. <br> 이 창은 종료하셔도 좋습니다.");
		
		return "/login/forgotPwd";
	}
	@RequestMapping(value="/resetPwd_ok.action",
			method = {RequestMethod.POST,RequestMethod.GET})
	public String resetPwd(String email,String userPwd,HttpServletRequest req) throws Exception{
		dao.resetPwd(email, userPwd);
		
		return "/login/login";
	}
	
	

}

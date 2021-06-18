package com.project.meeting;

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
			mav.setViewName("login");
			
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
		mav.setViewName("Register");
		
		return mav;
	}
	
	@RequestMapping(value="/register_ok.action", method = RequestMethod.POST)
	public String register_ok(UserDTO dto, HttpServletRequest req) throws Exception{
		
		//媛믩뱾�씠 議댁옱�븯�뒗 媛믩뱾�씠 �븘�땶吏� 援ы쁽
		if(dao.checkId(dto.getUserId()) != 0) {
			req.setAttribute("existId","�븘�씠�뵒媛� �씠誘� 議댁옱�빀�땲�떎." );
			return "Register";
		}
		if(dao.checkEmail(dto.getEmail()) != 0) {
			req.setAttribute("existEmail","�씠硫붿씪�씠 �씠誘� 議댁옱�빀�땲�떎." );
			return "Register";
		}
		
		dao.insertUserData(dto);
		
		return "redirect:/main.action"; 
	}
	
	@RequestMapping(value="/login.action",
			method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login() throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		
		return mav;
	}
	@RequestMapping(value="/logout.action",
			method = RequestMethod.POST)
	public ModelAndView logout(HttpServletRequest req) throws Exception{
		
		HttpSession session = req.getSession();
		session.removeAttribute("userInfo");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		
		return mav;
	}
	
	@RequestMapping(value="/login_ok.action",
			method = RequestMethod.POST)
	public String login_ok(String userId,String userPwd,String rememberBtn, HttpServletRequest req) throws Exception{
		
		//�븘�씠�뵒 or �씠硫붿씪 議댁옱�븯�뒗吏� �엳�떎硫� 鍮꾨�踰덊샇 留욌뒗吏� �솗�씤�븯�뒗 嫄� 援ы쁽
		if(dao.checkId(userId) == 0 && dao.checkEmail(userId) == 0) {
			req.setAttribute("noExistInfo","�븘�씠�뵒/�씠硫붿씪�씠�굹 鍮꾨�踰덊샇媛� ���졇�뒿�땲�떎." );
			return "login";
		}
		
		if(!dao.checkPwd(userId).equals(userPwd)) {
			req.setAttribute("noExistInfo","�븘�씠�뵒/�씠硫붿씪�씠�굹 鍮꾨�踰덊샇媛� ���졇�뒿�땲�떎." );
			return "login";
		}
		
		UserDTO dto = new UserDTO();
		
		dto = dao.getUserInfo(userId);
		
		UserInfo info = new UserInfo();
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getUserName());
		
		HttpSession session = req.getSession();
		
		session.setAttribute("userInfo", info);
		
		session.setMaxInactiveInterval(60*30); //30遺�
		
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
		
		return "forgotPwd";
	}
	
	@RequestMapping(value="/forgotPwd_ok.action",
			method = {RequestMethod.GET,RequestMethod.POST})
	public String forgotPwd_ok(String email, HttpServletRequest req) throws Exception{
		
		if(dao.checkEmail(email) == 0) {
			req.setAttribute("noExistEmail","�벑濡앸맂 �씠硫붿씪�씠 �뾾�뒿�땲�떎." );
			return "forgot-password";
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
			mailHelper.setSubject("Meeting鍮꾨�踰덊샇 珥덇린�솕 硫붿씪�엯�땲�떎.");
			mailHelper.setText("http://localhost:"+ req.getServerPort() +"/meeting/forgotPwd.action?email=" + email +"&wow=1",true);
			
			mailSender.send(mail);
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		req.setAttribute("sendedEmail","�벑濡앸맂 �씠硫붿씪二쇱냼濡� 硫붿씪�쓣 蹂대깉�뒿�땲�떎. �솗�씤�빐 二쇱꽭�슂. <br> �씠 李쎌� 醫낅즺�븯�뀛�룄 醫뗭뒿�땲�떎.");
		
		return "forgotPwd";
	}
	@RequestMapping(value="/resetPwd_ok.action",
			method = {RequestMethod.POST,RequestMethod.GET})
	public String resetPwd(String email,String userPwd,HttpServletRequest req) throws Exception{
		dao.resetPwd(email, userPwd);
		
		return "login";
	}
	
	

}

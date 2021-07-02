package com.project.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

import com.project.dao.RoomDAO;
import com.project.dto.UserInfo;
import com.project.dto.msgDTO;
import com.project.dto.noticeDTO;

public class AuthInterceptor extends WebContentInterceptor {
	
	@Autowired
	RoomDAO roomDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		{
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");
		
		if(info==null||info.equals(null)) {
			try {
				
				PrintWriter out = response.getWriter();
				out.print("<script>alert('로그인을 다시 해주십시오');"
						+ "location.href='/meeting/login.action';</script>");
				out.flush();
				out.close();
				
				
			} catch (IOException e) {
				return false;
			}
			return false;
		}else {
			// 알람가져오기
			List<noticeDTO> noticeList = roomDao.getNoticeList(info.getUserId());
			session.setAttribute("noticeList", noticeList);
			// 내메세지 가져오기
			List<msgDTO> msgList = roomDao.getMsgList(info.getUserId());
			session.setAttribute("msgList", msgList);
		}
		
		
		
		return true;
	}
}

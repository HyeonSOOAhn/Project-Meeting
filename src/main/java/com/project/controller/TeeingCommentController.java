package com.project.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.RegisterDAO;
import com.project.dao.TeeingCommentDAO;
import com.project.dto.TeeingCommentDTO;
import com.project.dto.UserDTO;
import com.project.dto.UserInfo;
import com.project.util.PageUtil;

@Controller
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
	public String comment(TeeingCommentDTO dto,HttpServletRequest request) throws Exception {
		
		//로그인 확인
		HttpSession session = request.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");
		
		if(info == null) {
			
			return "login/login";
			
		}
		
		UserDTO dto1 = new UserDTO();
		
		dto1 = dao2.getUserInfo(info.getUserId());
		dto.setUserId(dto1.getUserId());
		dto.setName(dto1.getName());
		
		dao.insertTeeingCommentData(dto);
		
		return tclist(request);
		
	}
	
	@RequestMapping(value = "/tclist.action")
	public String tclist(HttpServletRequest request) throws Exception {
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum!=null && pageNum!="") {
			currentPage = Integer.parseInt(pageNum);
		}
		
		int dataCount = dao.teeingCommentDataCount();
		
		int numPerPage = 5;
		int totalPage = pageUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<TeeingCommentDTO> lists = dao.getTeeingCommentLists(start, end);
		
		int listNum, n = 0;
		
		Iterator<TeeingCommentDTO> it = lists.iterator();
		while(it.hasNext()) {
			
			TeeingCommentDTO vo = it.next();
			listNum = dataCount - (start + n - 1);
			vo.setListNum(listNum);
			vo.setComments(vo.getComments().replaceAll("\n", "<br/>"));
			n++;
			
		}
		
		String pageIndexList = pageUtil.pageIndexList(currentPage, totalPage);
		
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("pageNum", currentPage);
		
		return "teeing/tclist";
		
	}
	
	@RequestMapping(value = "/tcdeleted.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String tcdeleted(HttpServletRequest request) throws Exception {
		
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
		String pageNum = request.getParameter("pageNum");
		
		dao.deleteTeeingCommentData(commentNum);
		
		request.setAttribute("pageNum", pageNum);
		
		return tclist(request);
		
	}
	
}

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

import com.project.dao.RegisterDAO;
import com.project.dao.TingCommentDAO;
import com.project.dto.TingCommentDTO;
import com.project.dto.UserDTO;
import com.project.dto.UserInfo;
import com.project.util.PageUtil;

@Controller
public class TingCommentController {
	
	@Autowired
	@Qualifier("tingCommentDAO")
	TingCommentDAO dao;
	
	@Autowired
	RegisterDAO dao2;
	
	@Autowired
	@Qualifier("pageUtil")
	PageUtil pageUtil;
	
	@RequestMapping(value = "/comment.action")
	public String comment(TingCommentDTO dto,HttpServletRequest request) throws Exception {
		
		int tingNum = Integer.parseInt(request.getParameter("tingNum"));
		
		//로그인 확인
		HttpSession session = request.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");
		
		if(info == null) {
			
			return "login/login";
			
		}
		
		UserDTO dto1 = new UserDTO();
		
		dto1 = dao2.getUserInfo(info.getUserId());
		dto.setTcuserId(dto1.getUserId());
		dto.setTcname(dto1.getName());
		
		dao.insertTingCommentData(dto);
		
		request.setAttribute("tingNum", tingNum);
		
		return tclist(request);
		
	}
	
	@RequestMapping(value = "/tclist.action")
	public String tclist(HttpServletRequest request) throws Exception {
		
		String cp = request.getContextPath();
		
		int tingNum = Integer.parseInt(request.getParameter("tingNum"));
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum!=null && pageNum!="") {
			currentPage = Integer.parseInt(pageNum);
		}
		
		int dataCount = dao.tingCommentDataCount(tingNum);
		
		int numPerPage = 5;
		int totalPage = pageUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<TingCommentDTO> lists = dao.getTingCommentLists(tingNum, start, end);
		
		int listNum, n = 0;
		
		Iterator<TingCommentDTO> it = lists.iterator();
		while(it.hasNext()) {
			
			TingCommentDTO vo = it.next();
			listNum = dataCount - (start + n - 1);
			vo.setListNum(listNum);
			vo.setComments(vo.getComments().replaceAll("\n", "<br/>"));
			n++;
			
		}
		
		String pageIndexList = pageUtil.pageIndexList(currentPage, totalPage);
		
		request.setAttribute("tingNum", tingNum);
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("pageNum", currentPage);
		
		return "ting/tclist"; //tmain인지 확인하기
		
	}
	
	@RequestMapping(value = "/tcdeleted.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String tcdeleted(HttpServletRequest request) throws Exception {
		
		int tingNum = Integer.parseInt(request.getParameter("tingNum"));
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
		String pageNum = request.getParameter("pageNum");
		
		dao.deleteTingCommentData(commentNum,tingNum);
		
		request.setAttribute("tingNum", tingNum);
		request.setAttribute("pageNum", pageNum);
		
		return tclist(request);
		
	}
	
}

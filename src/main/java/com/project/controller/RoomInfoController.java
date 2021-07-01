package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.RoomInfoDAO;
import com.project.dto.RoomInfoDTO;
import com.project.dto.UserInfo;

@Controller
public class RoomInfoController {
	
	@Autowired
	@Qualifier("roomInfoDAO")
	RoomInfoDAO dao;
	
//	방 리스트 메인
	@RequestMapping(value="/rroomInfoMain.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView roomInfo(HttpServletRequest request) throws Exception {
		
//		int start = 0;
//		int end = 0;
//		String subject = "";
//		String keyword = "";
//		
//		List<RoomInfoDTO> lists = dao.getRoomList(start, end, subject, keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomInfo/roomInfoMain");
		
//		mav.addObject("lists", lists);
		
		return mav;
	}
	
//	방 메인
	@RequestMapping(value="/rroom.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView room(HttpServletRequest request) throws Exception {
		
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		
		List<RoomInfoDTO> lists = new ArrayList<RoomInfoDTO>();
		
		String mode1 = request.getParameter("mode1");
		
		if(mode1 == null || mode1.equals("")) {
			
			lists = dao.getAllBoard(roomNum);
		} else {
			
			lists = dao.getSoltBoard(roomNum, mode1);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomInfo/room");
		mav.addObject("lists", lists);
		mav.addObject("roomNum", roomNum);
		mav.addObject("mode1", mode1);
//		mav.addObject("dto", dto);
		
		return mav;
	}
	
	
	@RequestMapping(value="/rarticle.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView article(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		UserInfo info = (UserInfo)session.getAttribute("userInfo");
		
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		RoomInfoDTO dto = dao.getBoardData(boardNum);
		String userId = info.getUserId();
		
		String mode1 = dto.getMode1();
		String content = "";
		
		if(mode1.equals("vote")) {
			
			String[] contents = dto.getBoardContent().split("&sep&");
			
			for(int i=0; i<contents.length; i++) {
				
				content += "<label><input type='radio' name='vote' value='" + i + "'/> " + contents[i] + "</label>";
			}
			
			dto.setBoardContent(content);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomInfo/article");
		mav.addObject("dto", dto);
		mav.addObject("userId", userId);
		
		return mav;
	}
	
	@RequestMapping(value="/rarticle_ok.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView article_ok(RoomInfoDTO dto, HttpServletRequest request) throws Exception {
		
		String mode = dto.getMode1();
		String boardNum = request.getParameter("boardNum");
		
		if(mode == "notice" || mode.equals("notice")) {
			
			dto.setBoardContent(dto.getBoardContent().replaceAll("\r\n", "<br/>"));
			
		} else if(mode == "schedule" || mode.equals("schedule")) {
			
			dto.setBoardContent(dto.getBoardContent().replaceAll("\r\n", "<br/>"));
			
		} else if(mode == "vote" || mode.equals("vote")) {
			
		}
		
		dao.insertRoomBoard(dto);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/rroom.action?roomNum=" + dto.getRoomNum());
		
		return mav;
	}
	
	@RequestMapping(value="/rdeleted_ok.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deleted_ok(HttpServletRequest request) throws Exception {
		
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		
		dao.deleteOne(boardNum);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/rroom.action?roomNum=" + roomNum);
		
		return mav;
	}
	
	@RequestMapping(value="/rupdated.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updated(HttpServletRequest request) throws Exception {
		
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		HttpSession session = request.getSession();
		UserInfo info = (UserInfo)session.getAttribute("userInfo");
		String mode2 = request.getParameter("mode2");
		
		String userId = info.getUserId();
		
		RoomInfoDTO dto = new RoomInfoDTO();
		
		dto.setRoomNum(roomNum);
		dto.setUserId(userId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomInfo/updated");
		mav.addObject("dto", dto);
		mav.addObject("mode2", mode2);
		
		return mav;
	}
	
	@RequestMapping(value="/rupdated_ok.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updated_ok(RoomInfoDTO dto, HttpServletRequest request) throws Exception {
		
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/rroom.action?roomNum=" + roomNum);
		
		return mav;
	}
	
//	게시판 등록
	@RequestMapping(value="/rcreated.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView created(HttpServletRequest request) throws Exception {
		
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		HttpSession session = request.getSession();
		UserInfo info = (UserInfo)session.getAttribute("userInfo");
		
		String userId = info.getUserId();
		
		RoomInfoDTO dto = new RoomInfoDTO();
		
		dto.setRoomNum(roomNum);
		dto.setUserId(userId);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("roomInfo/created");
		
		String mode2 = request.getParameter("mode2");
		
		if(mode2 != null && !mode2.equals("")) {
			
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			dto = dao.getBoardData(boardNum);
			mav.addObject("mode2", mode2);
			mav.addObject("boardNum", boardNum);
		}
		
		mav.addObject("dto", dto);
		
		return mav;
	}
	
	@RequestMapping(value="/rnotice.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView notice(HttpServletRequest request) throws Exception {
		
		String mode2 = request.getParameter("mode2");

		RoomInfoDTO dto = new RoomInfoDTO();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomInfo/notice");
		
		if(mode2 != null && !mode2.equals("")) {
			
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			
			dto = dao.getBoardData(boardNum);
			
			mav.addObject("mode2", mode2);
		}
		
		mav.addObject("dto", dto);
		
		return mav;
	}
	
	@RequestMapping(value="/rschedule.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView schedule(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomInfo/schedule");
		
		return mav;
	}
	
	@RequestMapping(value="/rvote.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView vote(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomInfo/vote");
		
		return mav;
	}
	
//	게시판 추가
	@RequestMapping(value="/rcreated_ok.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView created_ok(RoomInfoDTO dto, HttpServletRequest request) throws Exception {
		
		String mode = dto.getMode1();
		String mode2 = request.getParameter("mode2");
		

		
		if(mode2 != "" && !mode2.equals("")) {
			
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			
			dto.setBoardNum(boardNum);
			dao.updateData(dto);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/rroom.action?roomNum=" + dto.getRoomNum());
			
			return mav;
		}
		
		dto.setBoardNum(dao.getMaxBoardNum() + 1);
		dto.setBoardContent(dto.getBoardContent().replaceAll("\r\n", "<br/>"));
		
		dao.insertRoomBoard(dto);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/rroom.action?roomNum=" + dto.getRoomNum());
		
		return mav;
	}
}
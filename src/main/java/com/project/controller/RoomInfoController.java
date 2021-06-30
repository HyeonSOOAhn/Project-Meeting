package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.RoomInfoDAO;
import com.project.dto.RoomInfoDTO;

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
		
		int roomNum = 3;
		
		List<RoomInfoDTO> lists = new ArrayList<RoomInfoDTO>();
		
		String mode = request.getParameter("mode1");
		
		if(mode == null || mode.equals("")) {
			
			lists = dao.getAllBoard(roomNum);
		} else {
			
			lists = dao.getSoltBoard(roomNum, mode);
		}
//		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
//		String subject = request.getParameter("subject");
//		String keyword = request.getParameter("keyword");
		
		
		
//		System.out.println(String.format("room호출 : roomNum = %s, subject = %s, keyword = %s", roomNum, subject, keyword));
		
//		RoomDTO dto = dao.getRoomData(roomNum);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomInfo/room");
		mav.addObject("lists", lists);
		mav.addObject("roomNum", roomNum);
//		mav.addObject("dto", dto);
		
		return mav;
	}
	
//	게시판 등록
	@RequestMapping(value="/rcreated.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView created(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomInfo/created");
		
		return mav;
	}
	
	@RequestMapping(value="/rnotice.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView notice(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomInfo/notice");
		
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
		
		System.out.println("rcreated 호출");
		
		dto.setRoomNum(3);
//		dto.setBoardNum(dao.getMaxBoardNum());
		dto.setUserId("suzisuzi");
		
		String mode = dto.getMode1();
		
		if(mode == "notice" || mode.equals("notice")) {
			
//			System.out.println("boardTitle : " + dto.getBoardTitle());
//			System.out.println("boardContent : " + dto.getBoardContent());
			System.out.println(("notice 호출"));
//			dto.setBoardContent(dto.getBoardContent().replaceAll("\r\n", "<br/>"));
			
		} else if(mode == "schedule" || mode.equals("schedule")) {
			
//			selectDay
//			boardContent
//			adst
			System.out.println("schedule 호출");
			dto.setBoardContent(dto.getBoardContent().replaceAll("\r\n", "<br/>"));
			
		} else if(mode == "vote" || mode.equals("vote")) {
			
			
			System.out.println("vote 호출");
		}
		
		dao.insertRoomBoard(dto);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomInfo/room");
		
		return mav;
	}
	
//	getRoomList 테스트하기 위해 만듦
//	@RequestMapping(value="/test.action", method= {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView test(HttpServletRequest request) throws Exception {
//		
////		keyword부분에 들어갈 값
////		name = "*"일 경우 전체 데이터 검색
////		name = "1|2"일 경우 1 혹은 2가 들어간 값 검색
////		name = "111|222"일 경우 111 혹은 222가 들어간 값 검색
////		String name = "1 2";
//		
////		List<TestDTO> lists = dao.getTest(name);
//		
//		ModelAndView mav = new ModelAndView();
//		
//		mav.setViewName("roomInfo/test");
////		mav.addObject("lists", lists);
//		
//		return mav;
//	}
}
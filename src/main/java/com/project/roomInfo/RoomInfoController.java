package com.project.roomInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RoomInfoController {
	
	@Autowired
	@Qualifier("roomInfoDAO")
	RoomInfoDAO dao;
	
//	방 리스트 메인
	@RequestMapping(value="/roomInfoMain.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView roomInfo(HttpServletRequest request) throws Exception {
		
//		int start = 0;
//		int end = 0;
//		String subject = "";
//		String keyword = "";
//		
//		List<RoomInfoDTO> lists = dao.getRoomList(start, end, subject, keyword);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("RoomInfo/roomInfoMain");
		
//		mav.addObject("lists", lists);
		
		return mav;
	}
	
//	방 메인
	@RequestMapping(value="/room.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView room(HttpServletRequest request) throws Exception {
		
		int roomNum = 1;
//		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
//		String subject = request.getParameter("subject");
//		String keyword = request.getParameter("keyword");
		
		List<RoomInfoDTO> lists = dao.getBoardList(roomNum);
		
//		System.out.println(String.format("room호출 : roomNum = %s, subject = %s, keyword = %s", roomNum, subject, keyword));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("RoomInfo/room");
		mav.addObject("lists", lists);
		
		return mav;
	}
	
//	게시판 등록
	@RequestMapping(value="/created.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView created(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("RoomInfo/created");
		
		return mav;
	}
	
	@RequestMapping(value="/notice.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView notice(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("RoomInfo/notice");
		
		return mav;
	}
	
	@RequestMapping(value="/schedule.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView schedule(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("RoomInfo/schedule");
		
		return mav;
	}
	
	@RequestMapping(value="/vote.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView vote(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("RoomInfo/vote");
		
		return mav;
	}
	
//	게시판 추가
	@RequestMapping(value="/created_ok.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView created_ok(RoomInfoDTO dto, HttpServletRequest request) throws Exception {
		
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		int boardNum = dao.getMaxBoardNum();
		String userId = request.getParameter("userId");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String selectDay = request.getParameter("selectDay");
		String adst = request.getParameter("adst");
		String mode1 = request.getParameter("mode1");
		
		dto.setRoomNum(roomNum);
		dto.setBoardNum(boardNum + 1);
		dto.setUserId(userId);
		dto.setBoardNum(boardNum);
		dto.setBoardTitle(boardTitle);
		dto.setBoardContent(boardContent);
		dto.setSelectDay(selectDay);
		dto.setAdst(adst);
		dto.setMode(mode1);
		
		dao.insertRoomBoard(dto);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("RoomInfo/room");
		
		return mav;
	}
	
//	getRoomList 테스트하기 위해 만듦
	@RequestMapping(value="/test.action", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView test(HttpServletRequest request) throws Exception {
		
//		keyword부분에 들어갈 값
//		name = "*"일 경우 전체 데이터 검색
//		name = "1|2"일 경우 1 혹은 2가 들어간 값 검색
//		name = "111|222"일 경우 111 혹은 222가 들어간 값 검색
//		String name = "1 2";
		
//		List<TestDTO> lists = dao.getTest(name);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("RoomInfo/test");
//		mav.addObject("lists", lists);
		
		return mav;
	}
}
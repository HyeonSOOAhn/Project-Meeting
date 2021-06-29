package com.project.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.RoomDAO;
import com.project.dto.RoomDTO;
import com.project.dto.UserInfo;
import com.project.dto.msgDTO;
import com.project.util.RoomFileUtil;
import com.project.util.PageUtil;

@Controller
public class RoomController {
	
	@Autowired
	@Qualifier("roomDAO")
	RoomDAO dao;
	
	@Autowired
	@Qualifier("pageUtil")
	PageUtil pageUtil;
	
	@Autowired
	@Qualifier("roomFileUtil")
	RoomFileUtil roomFileUtil;
	
	@RequestMapping(value = "/index.action")
	public ModelAndView index() throws Exception {
		
		//http://localhost:8080/meeting/index.action
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("room/index");
		
		return mav;
		
	}
	
	//전체 방 --------------------------------------------------------------
	//방 만들기
	@RequestMapping(value = "/created.action")
	public ModelAndView created(HttpServletRequest request) throws Exception {
		
		//http://localhost:8080/meeting/created.action
		
		//로그인 확인
		HttpSession session = request.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");
		
		if(info == null) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("login/login");
			
			return mav;
		}
		
		String subject = request.getParameter("subject");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("room/created");
		
		if(subject!=null && !subject.equals("")) {
			mav.addObject("subject", subject);
		}
		
		return mav;
		
	}
	
	@RequestMapping(value = "/created_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String created_ok(RoomDTO dto,MultipartHttpServletRequest mpRequest) throws Exception {
		
		//dao.insertData(dto);
		
		List<Map<String, Object>> lists = roomFileUtil.parseInsertFileInfo(dto, mpRequest);
		
		int size = lists.size();
		
		for(int i=0;i<size;i++) {
			dao.insertData(lists.get(i));
		}
		
		// 여기
		//System.out.println(dto.getRoomNum());
		
		//dao.addMember(dto.getManager(), dto.getRoomNum(),"방장");
		
		
		return "redirect:/list.action";
		
	}
	
	//방 리스트
	@RequestMapping(value = "/list.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest request) throws Exception {
		
		//http://localhost:8080/meeting/list.action
		
		// 로그인 확인
		HttpSession session = request.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");

		if (info == null) {
			
			return "main";
		}
		
		String subject = request.getParameter("subject");
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchValue==null) {
			searchKey = "subject";
			searchValue = "";
		}else {
			if(request.getMethod().equalsIgnoreCase("GET")) {
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}
		}
		
		int dataCount = dao.getDataCount(searchKey, searchValue);
		
		int numPerPage = 5;
		int totalPage = pageUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<RoomDTO> lists = null;
		
		if(subject == null) {
			lists = dao.getLists(start, end, searchKey, searchValue);
		}else if(subject.equals("여행")) {
			lists = dao.travelGetLists(start, end, searchKey, searchValue);
		}else if(subject.equals("맛집")) {
			lists = dao.foodGetLists(start, end, searchKey, searchValue);
		}else if(subject.equals("운동")) {
			lists = dao.sportsGetLists(start, end, searchKey, searchValue);
		}else if(subject.equals("공부")) {
			lists = dao.studyGetLists(start, end, searchKey, searchValue);
		}
		
		
		/*
		Iterator<RoomDTO> it = lists.iterator();
		 
		while(it.hasNext()) {
		 
		 	RoomDTO dto = it.next(); 
		 	
		 	int roomNum = dto.getRoomNum();
		 
		 	List<Map<String,Object>> fileList = dao.selectFileList(roomNum);
		 
		 	request.setAttribute("fileList", fileList);
		  
		}
		*/
		//List<Map<String,Object>> fileList = dao.selectFileList();
		
		//param,url 사용자 정의
		String param = "";
		String listUrl = "";
		if(!searchValue.equals("")) {
			param = "searchKey=" + searchKey;
			param+= "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		
		if(subject!=null && !subject.equals("")) {
			listUrl = cp + "/list.action?subject="+subject;
			if(!param.equals("")) {
				listUrl += "&" + param;
			}
		}else {
			listUrl = cp + "/list.action";
			if(!param.equals("")) {
				listUrl += "?" + param;
			}
		}
		
		
		//페이징
		String pageIndexList = pageUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//article 사용자 정의
		String articleUrl = cp + "/article.action?pageNum=" + currentPage;
		
		if(!param.equals("")) {
			articleUrl += "&" + param;
		}
		
		String imagePath = request.getSession().getServletContext().getRealPath("/resources/upload/");
		
		
		//포워딩할 페이지에 넘길 데이터
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("subject", subject);
		request.setAttribute("articleUrl", articleUrl);
		//request.setAttribute("fileList", fileList);
		request.setAttribute("imagePath", imagePath);
		
		return "room/list";
		
	}
	
	//방 정보
	@RequestMapping(value = "/article.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String article(HttpServletRequest request) throws Exception {
		
		//로그인 확인
		HttpSession session = request.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");
		
		if(info == null) {
			
			return "redirect:/login.action";
			
		}
		
		String cp = request.getContextPath();
		
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		String pageNum = request.getParameter("pageNum");
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchValue!=null) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		RoomDTO dto = dao.getReadData(roomNum);
		
		//라인수
		int lineSu = dto.getIntroduce().split("\n").length;
		
		dto.setIntroduce(dto.getIntroduce().replaceAll("\n", "<br/>"));
		
		String param = "pageNum=" + pageNum;
		if(searchValue!=null) {
			param+= "&searchKey=" + searchKey;
			param+= "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("params", param);
		request.setAttribute("lineSu", lineSu);
		request.setAttribute("pageNum", pageNum);
		
		return "room/article";
		
	}
	
	//수정할 때 사진파일 등록하기.
	//파일 수정은 되나 searchkey,searchvalue주고 기존파일 삭제 안됨.
	
	//수정할 장소는 방안에서 하기.
	@RequestMapping(value = "/updated.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String updated(HttpServletRequest request) throws Exception {
		
		String cp = request.getContextPath();
		
		//javascript:location.href='<%=cp%>/updated.action?roomNum=${dto.roomNum }&${params }';
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		String pageNum = request.getParameter("pageNum");
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
				
		if(searchValue!=null) {
				
			if(request.getMethod().equalsIgnoreCase("get")) {
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}
					
		}else {
			searchKey = "subject"; 
			searchValue = ""; 
		}
		
		RoomDTO dto = dao.getReadData(roomNum);
		
		if(dto==null) {
			return "redirect:/list.action";
		}
		
		String param = "pageNum=" + pageNum;
				
		if(!searchValue.equals("")) {
			param+= "&searchKey=" + searchKey;
			param+= "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("params", param);
		request.setAttribute("searchKey", searchKey);
		request.setAttribute("searchValue", searchValue);
		
		return "room/updated";
		
	}
	
	@RequestMapping(value = "/updated_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String updated_ok(RoomDTO dto,HttpServletRequest request,MultipartHttpServletRequest mpRequest) throws Exception {
		
		String pageNum = request.getParameter("pageNum");
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		List<Map<String, Object>> lists = roomFileUtil.parseUpdateFileInfo(dto, mpRequest);
		
		int size = lists.size();
		
		for(int i=0;i<size;i++) {
			dao.updateData(lists.get(i));
		}
		
		String param = "pageNum=" + pageNum;
		
		if(!searchValue.equals("")) {
			param += "&searchKey=" + searchKey;
			param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		
		return "redirect:/list.action?" + param;
		
	}
	
	//삭제
	@RequestMapping(value = "/deleted.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String deleted(HttpServletRequest request) throws Exception {
		
		//javascript:location.href='<%=cp%>/deleted.action?roomNum=${dto.roomNum }&${params }';
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		String pageNum = request.getParameter("pageNum");
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		RoomDTO dto = dao.getReadData(roomNum);
		
		roomFileUtil.parseDeleteFileInfo(dto.getStoredFileName());
		
		dao.deleteData(roomNum);
		
		String param = "pageNum=" + pageNum;
		
		if(searchValue!=null) {
			param += "&searchKey=" + searchKey;
			param += "&searchValue=" + searchValue;
		}
		
		return "redirect:/list.action?" + param;
		
	}
	
	@RequestMapping(value = "/requestMsg.action", method = RequestMethod.POST)
	public @ResponseBody String roomRequest(HttpServletRequest request, String roomNum,String introduce) throws Exception {

		HttpSession session = request.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");
		
		int rNum = Integer.parseInt(roomNum);

		RoomDTO dto = dao.getReadData(rNum);

		msgDTO msg = new msgDTO();

		msg.setRoomNum(rNum);
		msg.setSender(info.getUserId());
		msg.setRecipient(dto.getManager());
		msg.setMsg("[" + info.getUserName() + "(" + info.getUserId() + ")" + "] 님이 [" + dto.getTitle()
				+ "] 에 가입 요청을 보냈습니다.");
		msg.setIntroduce(introduce);

		dao.insertMsg(msg);

		return "success";

	}
	
	@RequestMapping(value = "/msgConfirm.action", method = { RequestMethod.POST })
	public @ResponseBody String msgConfirm(HttpServletRequest request, String roomNum)
			throws Exception {
		
		HttpSession session = request.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");
		
		
		if(dao.existMsg(Integer.parseInt(roomNum), info.getUserId()) !=0 ) {
			return "exist";
		}
				
		return "noexist";
	}

	@RequestMapping(value = "/modalAccept.action", method = { RequestMethod.POST})
	public @ResponseBody String modalAccept(HttpServletRequest request,String msgNum,String sender,String roomNum)
			throws Exception {
		

		// 메시지 상태 수락으로 바꾸기
		dao.changeRequestAccept(Integer.parseInt(msgNum));
		//멤버 추가
		dao.addMember(sender, Integer.parseInt(roomNum),"멤버");

		return "success";
	}
	
	@RequestMapping(value = "/modalReject.action", method = { RequestMethod.POST})
	public @ResponseBody String modalReject(HttpServletRequest request,String msgNum)
			throws Exception {
		// 메시지 상태 거절로 바꾸기
		dao.changeRequestReject(Integer.parseInt(msgNum));
		
		return "success";
	}
	

}


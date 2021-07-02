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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.RecoDAO;
import com.project.dao.RegisterDAO;
import com.project.dao.RoomDAO;
import com.project.dto.RecoDTO;
import com.project.dto.RoomDTO;
import com.project.dto.UserDTO;
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
	@Qualifier("recoDAO")
	RecoDAO recodao;
	
	@Autowired
	RegisterDAO regiDao;
	
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
	public ModelAndView created(HttpServletRequest request,
								@RequestParam(value = "recoNum", required = false, defaultValue = "99999") int recoNum)
								throws Exception {
		
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
		
		if(recoNum!=99999) {
			RecoDTO list = recodao.getReadData(recoNum);
			recodao.increasePop(recoNum);
			list.setKeyword("#"+list.getKeyword());
			if(list.getContent()!=null) {
			list.setContent(list.getContent().replace("<br/>", "\r\n"));}
			list.setIntroduce(list.getIntroduce().replace("<br/>", "\r\n"));
			mav.addObject("list",list);
			
		}
		
		return mav;
		
	}
	
	@RequestMapping(value = "/created_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String created_ok(RoomDTO dto,MultipartHttpServletRequest mpRequest) throws Exception {
		
		HttpSession session = mpRequest.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");
		
		//파일 올리기
		MultipartFile mf = mpRequest.getFile("roomProfileFile");
		Map<String, String> map = roomFileUtil.uploadRoomProfile(mf);
		
		dto.setStoredFileName(map.get("storedFileName"));
		dto.setOriginalFileName(map.get("originalFileName"));
		dao.insertData(dto);
		dao.addManager(info.getUserId());
		
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
		
		UserDTO userDto = regiDao.getUserInfo(info.getUserId());
		
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
		request.setAttribute("userRight", userDto.getRight());
		
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
		
		int memberUser = dao.readMember(roomNum,info.getUserId());
		
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
		
		request.setAttribute("memberUser", memberUser);
		
		return "room/article";
		
	}
	
	//수정할 때 사진파일 등록하기.
	//파일 수정은 되나 searchkey,searchvalue주고 기존파일 삭제 안됨.
	
	//수정할 장소는 방안에서 하기.
	@RequestMapping(value = "/updated.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String updated(HttpServletRequest request) throws Exception {
		
		//javascript:location.href='<%=cp%>/updated.action?roomNum=${dto.roomNum }&${params }';
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		
		RoomDTO dto = dao.getReadData(roomNum);
		
		if(dto==null) {
			return "redirect:/list.action";
		}
		
		request.setAttribute("dto", dto);
		
		return "room/updated";
		
	}
	
	//삭제
	@RequestMapping(value = "/deleted.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String deleted(HttpServletRequest request) throws Exception {
		
		//javascript:location.href='<%=cp%>/deleted.action?roomNum=${dto.roomNum }&${params }';
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		String pageNum = request.getParameter("pageNum");
		
		RoomDTO dto = dao.getReadData(roomNum);
		
		roomFileUtil.parseDeleteFileInfo(dto.getStoredFileName());
		
		dao.deleteData(roomNum);
		
		return "redirect:/list.action?" + pageNum;
		
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
	public @ResponseBody String modalAccept(HttpServletRequest request,String msgNum,String sender,String recipient,String roomNum)
			throws Exception {
		
		int number = Integer.parseInt(roomNum);
		
		RoomDTO dto = dao.getReadData(number);
		
		if(dto.getCurrentP() >= dto.getTotalP()) {
			
			return "fail";
		}
		

		// 메시지 상태 수락으로 바꾸기
		dao.changeRequestAccept(Integer.parseInt(msgNum));
		//멤버 추가
		dao.addMember(sender, Integer.parseInt(roomNum));
		
		dao.updateCurrentP(number);
		
		
		String msg = dto.getTitle() + "에 보낸 요청이 수락 되었습니다. 축하합니다! :-)";	
		//수락 알림 보내기
		dao.insertNotice(sender,recipient,msg);
		
		return "success";
	}
	
	@RequestMapping(value = "/modalReject.action", method = { RequestMethod.POST})
	public @ResponseBody String modalReject(HttpServletRequest request,String msgNum,String sender,String recipient,String roomNum)
			throws Exception {
		// 메시지 상태 거절로 바꾸기
		dao.changeRequestReject(Integer.parseInt(msgNum));
		
		int number = Integer.parseInt(roomNum);
		
		RoomDTO dto = dao.getReadData(number);
		
		String msg = dto.getTitle() + "에 보낸 요청이 거절 되었습니다. :-(";	
		//거절 알림 보내기
		dao.insertNotice(sender,recipient,msg);
		
		return "success";
	}
	@RequestMapping(value = "/alterationRoomProfileImg.action", method = { RequestMethod.POST })
	public @ResponseBody String alterationProfileImg(MultipartHttpServletRequest mpRequest) 
			throws Exception {
		HttpSession session = mpRequest.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");
		
		//파일 올리기
		MultipartFile mf = mpRequest.getFile("roomProfile");
		Map<String, String> map = roomFileUtil.uploadRoomProfile(mf);
		
		String roomNum = mpRequest.getParameter("roomNum");
		
		RoomDTO dto = dao.getReadData(Integer.parseInt(roomNum));
		
		roomFileUtil.parseDeleteFileInfo(dto.getStoredFileName());
		
		map.put("roomNum", Integer.toString(dto.getRoomNum()));
		
		dao.updateProfileImg(map);
		

		return "success";
	}
	

}


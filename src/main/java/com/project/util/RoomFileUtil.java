package com.project.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dto.RoomDTO;

@Component("roomFileUtil")
public class RoomFileUtil {
	
	//파일이 저장될 위치
	//private static final String filePath = "D:\\sts-bundle\\Project-Meeting\\src\\main\\webapp\\resources\\upload\\";
	//private static final String filePath = "D:\\sts-bundle\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Meeting\\resources\\upload\\";
	private static final String filePath = "C:\\upload\\"; //<img src='<spring:url value="/upload/${dto.storedFileName }"/>' width="300" height="300"/>
	
	//파일 업로드
	public List<Map<String,Object>> parseInsertFileInfo (RoomDTO dto,MultipartHttpServletRequest mpRequest) throws Exception {
		
		/*
		Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다.
		List나 배열은 순차적으로 데이터의 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다.
		Iterator을 이용하여 Map에 있는 데이터들을 while문을 이용하여 순차적으로 접근합니다.
		*/
		
		Iterator<String> it = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String,Object>> lists = new ArrayList<Map<String,Object>>();
		Map<String,Object> listsMap = null;
		
		//int roomNum = dto.getRoomNum();
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(it.hasNext()) {
			
			multipartFile = mpRequest.getFile(it.next());
			
			if(multipartFile.isEmpty() == false) {
				
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listsMap = new HashMap<String, Object>();
				
				listsMap.put("roomNum",dto.getRoomNum());
				listsMap.put("subject",dto.getSubject());
				listsMap.put("title",dto.getTitle());
				listsMap.put("keyword",dto.getKeyword());
				listsMap.put("introduce",dto.getIntroduce());
				if(dto.getTotalP()==0) {
					listsMap.put("totalP", dto.getTotalPDirect());
				}else if(dto.getTotalP()!=0) {
					listsMap.put("totalP", dto.getTotalP());
				}
				listsMap.put("manager",dto.getManager());
				
				listsMap.put("originalFileName", originalFileName);
				listsMap.put("storedFileName", storedFileName);
				//listsMap.put("fileSize", multipartFile.getSize());
				
				lists.add(listsMap);
				
			}
			
		}
		
		return lists;
		
	}
	
	//파일 수정
	public List<Map<String,Object>> parseUpdateFileInfo (RoomDTO dto,MultipartHttpServletRequest mpRequest) throws Exception {
		
		Iterator<String> it = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String,Object>> lists = new ArrayList<Map<String,Object>>();
		Map<String,Object> listsMap = null;
		
		//기존 파일 삭제
		File deleteFile = new File(filePath + dto.getStoredFileName());
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(it.hasNext()) {
			
			multipartFile = mpRequest.getFile(it.next());
			
			if(multipartFile.isEmpty() == false) {
				
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listsMap = new HashMap<String, Object>();
				
				listsMap.put("roomNum",dto.getRoomNum());
				listsMap.put("title",dto.getTitle());
				listsMap.put("keyword",dto.getKeyword());
				listsMap.put("introduce",dto.getIntroduce());
				
				listsMap.put("storedFileName", storedFileName);
				listsMap.put("originalFileName", originalFileName);
				
				/*
				if(keepStoredFileName!=null && keepOriginalFileName!=null) {
					listsMap.put("storedFileName", keepStoredFileName);
					listsMap.put("originalFileName", keepOriginalFileName);
				}else {
					listsMap.put("storedFileName", storedFileName);
					listsMap.put("originalFileName", originalFileName);
				}
				*/
				
				lists.add(listsMap);
				
			}
			
		}
		
		return lists;
		
	}
	
	//파일 삭제
	public void parseDeleteFileInfo (String storedFileName) {
		
		File file = new File(filePath + storedFileName);
		
		if(file.exists()) {
			file.delete();
		}
		
	}
	
	//32글자의 랜덤한 문자열(숫자포함)을 만들어서 반환해주는 기능
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
}

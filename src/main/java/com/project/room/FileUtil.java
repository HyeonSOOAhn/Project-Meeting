package com.project.room;

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

@Component("fileUtil")
public class FileUtil {
	
	//파일이 저장될 위치
	private static final String filePath = "D:\\sts-bundle\\Project-Meeting\\src\\main\\webapp\\resources\\upload\\";
	
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
		
		int roomNum = dto.getRoomNum();
		
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
				listsMap.put("roomNum", roomNum);
				listsMap.put("originalFileName", originalFileName);
				listsMap.put("storedFileName", storedFileName);
				listsMap.put("fileSize", multipartFile.getSize());
				
				lists.add(listsMap);
				
			}
			
		}
		
		return lists;
		
	}
	
	//32글자의 랜덤한 문자열(숫자포함)을 만들어서 반환해주는 기능
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
}

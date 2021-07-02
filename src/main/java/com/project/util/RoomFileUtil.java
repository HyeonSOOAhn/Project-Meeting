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

	// 파일이 저장될 위치
	// private static final String filePath =
	// "D:\\sts-bundle\\Project-Meeting\\src\\main\\webapp\\resources\\upload\\";
	// private static final String filePath =
	// "D:\\sts-bundle\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Meeting\\resources\\upload\\";
	private static final String filePath = "C:\\upload\\"; // <img src='<spring:url value="/upload/${dto.storedFileName
															// }"/>' width="300" height="300"/>

	
	//이미지 업로드
		public Map<String, String> uploadRoomProfile(MultipartFile mf) {
			
			String originalFileName = null;
			String originalFileExtension = null;
			String storedFileName = null;
			
			File f = new File(filePath);
	        if (!f.exists()) {
	            f.mkdirs();
	        }

	        try {
	        	originalFileName = mf.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;

				f = new File(filePath + storedFileName);
				mf.transferTo(f);
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
	        Map<String, String> map = new HashMap<String, String>();
	        map.put("storedFileName", storedFileName);
	        map.put("originalFileName", originalFileName);
	     
			return map;
		}


	// 파일 삭제
	public void parseDeleteFileInfo(String storedFileName) {

		File file = new File(filePath + storedFileName);

		if (file.exists()) {
			file.delete();
		}

	}

	// 32글자의 랜덤한 문자열(숫자포함)을 만들어서 반환해주는 기능
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}

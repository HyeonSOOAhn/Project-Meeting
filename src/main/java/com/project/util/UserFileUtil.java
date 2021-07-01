package com.project.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.project.dto.UserDTO;

@Component("userFileUtil")
public class UserFileUtil {

	// 파일이 저장될 위치
	private static final String filePath = "C:\\image\\"; //<img src='<spring:url value="/image/${dto.ustoredFileName}"/>' width="300" height="300"/>

	//이미지 변경
	public Map<String, String> changeProfile(MultipartHttpServletRequest mpRequest) {
		
		String uoriginalFileName = null;
		String uoriginalFileExtension = null;
		String ustoredFileName = null;
		
		File f = new File(filePath);
        if (!f.exists()) {
            f.mkdirs();
        }

        try {
        	
        	MultipartFile mf = mpRequest.getFile("fileProfile");
        	uoriginalFileName = mf.getOriginalFilename();
			uoriginalFileExtension = uoriginalFileName.substring(uoriginalFileName.lastIndexOf("."));
			ustoredFileName = getRandomString() + uoriginalFileExtension;

			f = new File(filePath + ustoredFileName);
			mf.transferTo(f);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
        Map<String, String> map = new HashMap<String, String>();
        map.put("ustoredFileName", ustoredFileName);
        map.put("uoriginalFileName", uoriginalFileName);
     
		return map;
	}
	
	
	// 파일 삭제
	public void parseDeleteFileInfo(String ustoredFileName) {

		File file = new File(filePath + ustoredFileName);

		if (file.exists()) {
			file.delete();
		}

	}

	// 32글자의 랜덤한 문자열(숫자포함)을 만들어서 반환해주는 기능
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}

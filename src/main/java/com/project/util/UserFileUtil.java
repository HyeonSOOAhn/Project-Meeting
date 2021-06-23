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

import com.project.dto.UserDTO;

@Component("userFileUtil")
public class UserFileUtil {
	
	//파일이 저장될 위치
	//private static final String filePath = "D:\\sts-bundle\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Meeting\\resources\\upload\\";
	private static final String filePath = "D:\\sts-bundle\\Project-Meeting\\src\\main\\webapp\\resources\\upload\\";
	
	//파일 업로드
	public List<Map<String,Object>> parseInsertFileInfo (UserDTO dto,MultipartHttpServletRequest mpRequest) throws Exception {
		
		Iterator<String> it = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String uoriginalFileName = null;
		String uoriginalFileExtension = null;
		String ustoredFileName = null;
		
		List<Map<String,Object>> lists = new ArrayList<Map<String,Object>>();
		Map<String,Object> listsMap = null;
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(it.hasNext()) {
			
			multipartFile = mpRequest.getFile(it.next());
			
			if(multipartFile.isEmpty() == false) {
				
				uoriginalFileName = multipartFile.getOriginalFilename();
				uoriginalFileExtension = uoriginalFileName.substring(uoriginalFileName.lastIndexOf("."));
				ustoredFileName = getRandomString() + uoriginalFileExtension;
				
				file = new File(filePath + ustoredFileName);
				multipartFile.transferTo(file);
				listsMap = new HashMap<String, Object>();
				
				listsMap.put("userNum",dto.getUserNum());
				listsMap.put("userId",dto.getUserId());
				listsMap.put("userPwd",dto.getUserPwd());
				listsMap.put("name",dto.getName());
				listsMap.put("gender",dto.getGender());
				listsMap.put("email", dto.getEmail());
				listsMap.put("tel",dto.getTel());
				
				listsMap.put("uoriginalFileName", uoriginalFileName);
				listsMap.put("ustoredFileName", ustoredFileName);
				
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

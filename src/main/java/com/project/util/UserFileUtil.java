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
	// private static final String filePath =
	// "D:\\sts-bundle\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Meeting\\resources\\upload\\";
	// private static final String filePath =
	// "D:\\sts-bundle\\Project-Meeting\\src\\main\\webapp\\resources\\upload\\";
	// //src="upload/${dto.ustoredFileName }"
	private static final String filePath = "C:\\image\\"; // <img src='<spring:url value="/image/${dto.ustoredFileName
															// }"/>' width="300" height="300"/>

	//이미지 변경
	public Map<String, String> changeProfile(MultipartHttpServletRequest mpRequest) {
		
		String fileName = "";
		String uoriginalFileName = null;
		String uoriginalFileExtension = null;
		String ustoredFileName = null;
		
		File f = new File(filePath);
        if (!f.exists()) {
            f.mkdirs();
        }
        String encType = "UTF-8";
        int maxFilesize = 5 * 1024 * 1024;
  
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
	
	
	// 파일 업로드
	public List<Map<String, Object>> parseInsertFileInfo(UserDTO dto, MultipartHttpServletRequest mpRequest)
			throws Exception {

		Iterator<String> it = mpRequest.getFileNames();

		MultipartFile multipartFile = null;
		String uoriginalFileName = null;
		String uoriginalFileExtension = null;
		String ustoredFileName = null;

		List<Map<String, Object>> lists = new ArrayList<Map<String, Object>>();
		Map<String, Object> listsMap = null;

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (it.hasNext()) {

			multipartFile = mpRequest.getFile(it.next());

			if (multipartFile.isEmpty() == false) {

				uoriginalFileName = multipartFile.getOriginalFilename();
				uoriginalFileExtension = uoriginalFileName.substring(uoriginalFileName.lastIndexOf("."));
				ustoredFileName = getRandomString() + uoriginalFileExtension;

				System.out.println(ustoredFileName);
				
				file = new File(filePath + ustoredFileName);
				multipartFile.transferTo(file);
				listsMap = new HashMap<String, Object>();

				listsMap.put("userNum", dto.getUserNum());
				listsMap.put("userId", dto.getUserId());
				listsMap.put("userPwd", dto.getUserPwd());
				listsMap.put("name", dto.getName());
				listsMap.put("gender", dto.getGender());
				listsMap.put("email", dto.getEmail());
				listsMap.put("tel", dto.getTel());

				listsMap.put("uoriginalFileName", uoriginalFileName);
				listsMap.put("ustoredFileName", ustoredFileName);

				lists.add(listsMap);

			}

		}

		return lists;

	}

	// 파일 수정
	public List<Map<String, Object>> parseUpdateFileInfo(UserDTO dto, MultipartHttpServletRequest mpRequest)
			throws Exception {

		Iterator<String> it = mpRequest.getFileNames();

		MultipartFile multipartFile = null;
		String uoriginalFileName = null;
		String uoriginalFileExtension = null;
		String ustoredFileName = null;

		List<Map<String, Object>> lists = new ArrayList<Map<String, Object>>();
		Map<String, Object> listsMap = null;

		// 기존 파일 삭제
		File deleteFile = new File(filePath + dto.getUstoredFileName());
		if (deleteFile.exists()) {
			deleteFile.delete();
		}

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (it.hasNext()) {

			multipartFile = mpRequest.getFile(it.next());

			if (multipartFile.isEmpty() == false) {

				uoriginalFileName = multipartFile.getOriginalFilename();
				uoriginalFileExtension = uoriginalFileName.substring(uoriginalFileName.lastIndexOf("."));
				ustoredFileName = getRandomString() + uoriginalFileExtension;

				file = new File(filePath + ustoredFileName);
				multipartFile.transferTo(file);
				listsMap = new HashMap<String, Object>();

				listsMap.put("userId", dto.getUserId());
				listsMap.put("userPwd", dto.getUserPwd());
				listsMap.put("name", dto.getName());
				listsMap.put("email", dto.getEmail());
				listsMap.put("tel", dto.getTel());

				listsMap.put("uoriginalFileName", uoriginalFileName);
				listsMap.put("ustoredFileName", ustoredFileName);

				lists.add(listsMap);

			}

		}

		return lists;

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

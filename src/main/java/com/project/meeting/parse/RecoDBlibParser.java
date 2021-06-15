package com.project.meeting.parse;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.meeting.reco.dao.RecoDAO;
import com.project.meeting.reco.dto.RecoDTO;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;


public class RecoDBlibParser {
	
	
	
	/*
	 * public static void main(String[] args) throws IOException,
	 * InterruptedException { DBparser(1); }
	 */
	 
	 
	
    public static String naverImg(String title) throws IOException {
    	//네이버이미지 검색 API
    	String clientID = "35pKO_jU57WPSwxCblWm"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "kkmJ_uImfj"; //애플리케이션 클라이언트 시크릿값"
        
        String text = null;
        try {
            text = URLEncoder.encode(title, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }
        
        StringBuilder urlBuilder = new StringBuilder(("https://openapi.naver.com/v1/search/image?query=") + text); /*URL*/
        urlBuilder.append("&display=1");

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestProperty("X-Naver-Client-Id", clientID);
        conn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        conn.setRequestMethod("GET");
        
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        System.out.println(sb.toString());
        
        JsonParser Parser = new JsonParser();
        JsonObject jObj = (JsonObject) Parser.parse(sb.toString());
        JsonArray memberArray = (JsonArray) jObj.get("items");
        
        String result = "";
        
        if(jObj.get("total").getAsInt()!=0) {
        JsonObject object = (JsonObject) memberArray.get(0);
        System.out.println(object);
        RecoDTO dto = new RecoDTO();
        result =((object.get("thumbnail")).toString()).replace("\"", "");
        }
        
        return result;  
    }


	
    public static List<RecoDTO> DBparser(int pageNum) throws IOException, InterruptedException {
    	//도서관 API
        StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_lbrry_api"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=wx1FtCvq2AivHsuIAfn24wTlffKB2K7uVzmPcNxwKSbT2ZNKATW4WdEDX%2Fx7MPv4PTxrP3zUqPANPq%2Byqdz5tg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + (pageNum-1)); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*XML/JSON 여부*/

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
         
        //파싱
        JsonParser Parser = new JsonParser();
        JsonObject jObj1 = (JsonObject) Parser.parse(sb.toString());
        jObj1 = (JsonObject) jObj1.get("response");
        jObj1 = (JsonObject) jObj1.get("body");
        JsonArray memberArray = (JsonArray) jObj1.get("items");
        
        List<RecoDTO> list = new ArrayList<RecoDTO>();
        for (int i = 0; i < memberArray.size(); i++) {
        	RecoDTO dto = new RecoDTO();
        	JsonObject object = (JsonObject) memberArray.get(i);
			
			dto.setRecoNum(i);
			dto.setSubject("study");
			dto.setKeyword("library");
        	dto.setTitle(((object.get("lbrryNm")).toString()).replace("\"", ""));//도서관명 title 
        	dto.setIntroduce("시도명 : " + ((object.get("ctprvnNm")).toString()).replace("\"", "")//시도명 introduce
        	+ "<br/>시군구명 : " + ((object.get("signguNm")).toString()).replace("\"", "")//시군구명 introduce
        	+ "<br/>도서관 유형 : " + ((object.get("lbrrySe")).toString()).replace("\"", ""));//도서관 유형 introduce
        	dto.setContent("휴관일 : " + ((object.get("closeDay")).toString()).replace("\"", "")//휴관일 content
        	+ "<br/>평일운영시작시간 : " + ((object.get("weekdayOperOpenHhmm")).toString()).replace("\"", "")//평일운영시작시간 content
        	+ "<br/>평일운영종료시간 : " + ((object.get("weekdayOperColseHhmm")).toString()).replace("\"", "")//평일운영종료시간 content
        	+ "<br/>토요일운영시작시각 : " + ((object.get("satOperOperOpenHhmm")).toString()).replace("\"", "")//토요일운영시작시각 content
        	+ "<br/>토요일운영종료시각 : " + ((object.get("satOperCloseHhmm")).toString()).replace("\"", "")//토요일운영종료시각 content
        	+ "<br/>공휴일운영시작시각 : " + ((object.get("holidayOperOpenHhmm")).toString()).replace("\"", "")//공휴일운영시작시각 content
        	+ "<br/>공휴일운영종료시각 : " + ((object.get("holidayCloseOpenHhmm")).toString()).replace("\"", "")//공휴일운영종료시각 content
        	+ "<br/>도서관전화번호 : " + ((object.get("phoneNumber")).toString()).replace("\"", ""));////도서관전화번호 content
        	dto.setLocation("소재지도로명주소 : " + ((object.get("rdnmadr")).toString()).replace("\"", ""));//소재지도로명주소 location
			dto.setImgUrl(naverImg(dto.getTitle()));  
        	
        	list.add(dto);
        	Thread.sleep(50);

        }
        
        return list;
		
    }
}

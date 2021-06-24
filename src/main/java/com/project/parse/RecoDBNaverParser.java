package com.project.parse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.dto.RecoDTO;

public class RecoDBNaverParser {
	
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
        
        
        
        JsonParser Parser = new JsonParser();
        JsonObject jObj = (JsonObject) Parser.parse(sb.toString());
        JsonArray memberArray = (JsonArray) jObj.get("items");
        
        String result = "";
        try {
        	if(jObj.get("total").getAsInt()!=0) {
  			  JsonObject object = (JsonObject) memberArray.get(0);
  	            
  	            RecoDTO dto = new RecoDTO();
  	            result =((object.get("thumbnail")).toString()).replace("\"", "");
  		  }
        	
		} catch (NullPointerException e) {
			// TODO: handle exception
		}
		
		  
		 
        
        return result;  
    }

}

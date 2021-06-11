package com.project.meeting.parse;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.BufferedReader;
import java.io.IOException;

public class RecoDBlibParser {
    public static void DBparser() throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_lbrry_api"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=wx1FtCvq2AivHsuIAfn24wTlffKB2K7uVzmPcNxwKSbT2ZNKATW4WdEDX%2Fx7MPv4PTxrP3zUqPANPq%2Byqdz5tg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*XML/JSON 여부*/

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
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
        
        System.out.println(sb.toString());  
        
        JsonParser Parser = new JsonParser();
        JsonObject jObj1 = (JsonObject) Parser.parse(sb.toString());
        jObj1 = (JsonObject) jObj1.get("response");
        jObj1 = (JsonObject) jObj1.get("body");
        JsonArray memberArray = (JsonArray) jObj1.get("items");
        
        for (int i = 0; i < memberArray.size(); i++) {          
        	JsonObject object = (JsonObject) memberArray.get(i);
        	System.out.println(((object.get("lbrryNm")).toString()).replace("\"", ""));//도서관명  
        	System.out.println(object.get("ctprvnNm"));//시도명
        	System.out.println(object.get("signguNm"));//시군구명
        	System.out.println(object.get("lbrrySe"));//도서관 유형
        	System.out.println(object.get("closeDay"));//휴관일
        	System.out.println(object.get("weekdayOperOpenHhmm"));//평일운영시작시간
        	System.out.println(object.get("weekdayOperColseHhmm"));//평일운영종료시간
        	System.out.println(object.get("satOperOperOpenHhmm"));//토요일운영시작시각
        	System.out.println(object.get("satOperCloseHhmm"));//토요일운영종료시각
        	System.out.println(object.get("holidayOperOpenHhmm"));//공휴일운영시작시각
        	System.out.println(object.get("holidayCloseOpenHhmm"));//공휴일운영종료시각
        	System.out.println(object.get("rdnmadr"));//소재지도로명주소
        	System.out.println(object.get("phoneNumber"));////도서관전화번호
        }
    }
}

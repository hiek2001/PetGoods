package com.practive.study;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.*;
import org.json.simple.JSONObject;



public class IamportApi {
	/**
	 *  HttpServletRequest : HTTP프로토콜의 request 정보를 servlet에게 전달하기 위한 목적으로 사용/ 헤더정보, 파라미터, 쿠키, URL등을 읽어들일 수 있음
	 *  HttpServletResponse : WAS는 어떤 client가 요청을 보냈는지 알고 있고, 해당 client에게 응답을 보내기 위한 HttpServletResponse객체를 생성하여 servlet에게 전달
	**/	
	public static String getToken(JSONObject json, String reqeustURL) throws Exception {
		
		String _token = "";
		try {
			
			String requestString = "";
			
			// url : web에서 존재하는 자원에 접근할 때 java 내에서 url을 처리하고 싶을 때 사용
			URL url = new URL(reqeustURL);
			// 해당 url에서 페이지 정보를 가져오기 위한 것
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			// url 연결은 입출력에 사용 가능. 출력용으로 사용할 경우 true로 설정. 입력용은 false.
			conn.setRequestProperty("Content-Type","application/json"); //reqeustBody로 전달 됨
			conn.setDoOutput(true);
			conn.setInstanceFollowRedirects(false);
			conn.setRequestMethod("POST");
			
			// data를 담기 위한 객체 생성
			OutputStream os = conn.getOutputStream();
			// String을 Byte로 변환
			os.write(json.toString().getBytes());
			// 네트워크 상 다른 곳에 있는 곳에 실제 연결
			conn.connect();
			
			StringBuilder sb = new StringBuilder();
			int responseCode = conn.getResponseCode();
			// getResponseCode : HTTP응답 메시지로부터 status 코드 취득 (200 / 400 etc)
			// HTTP_OK : status 코드 200인 경우 > 정상
			if(responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
				
				// 입력받은 내용을 BufferedReader에 저장
				String line = null;
				while((line = br.readLine()) != null) {
					sb.append(line+"\n");
				}
				br.close();
				requestString = sb.toString();
			}
			// 버퍼에 남아있는 데이터 모두 출력하고 버퍼 비움
			os.flush();
			conn.disconnect();	
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);

			if((Long)jsonObj.get("code")  == 0){
				JSONObject getToken = (JSONObject) jsonObj.get("response");
				System.out.println("getToken==>>"+getToken.get("access_token") );
				_token = (String)getToken.get("access_token");

			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			_token = "";
		}
		return _token;
	}
}

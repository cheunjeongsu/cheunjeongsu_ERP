package org.spring.my.service;

import java.util.Map;

public interface NaverLoginService {
	//네이버로그인 apiurl 생성
	public Map<String, String> getApiUrl() throws Exception;
	//접근 토큰 얻기
	public String getToken(String code, String state) throws Exception;
	//개인 정보 얻기
	public  Map<String, String> getNaverUserInfo(String access_token) throws Exception;
	public void insert(Map<String, String> resultMap);
}

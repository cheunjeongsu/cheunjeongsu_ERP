package org.spring.my.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.spring.my.service.NaverLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("naverlogin")
public class NaverLoginController {
	@Autowired
	private NaverLoginService naverLoginService;
	
	//네이버 로그인 callback메소드
	@RequestMapping("callback")
	public String callback(String code, String state, HttpSession session) throws Exception{
		//정보를 얻기 위한 토큰 얻기
		String access_token = naverLoginService.getToken(code, state);
		//토큰을 이용한 개인정보 얻기
		Map<String, String> resultMap = naverLoginService.getNaverUserInfo(access_token);
		 naverLoginService.insert(resultMap); //회원가입
		 session.setAttribute("userid", resultMap.get("email"));
		 session.setAttribute("name", resultMap.get("name"));
		 return "home/main";
	}
}

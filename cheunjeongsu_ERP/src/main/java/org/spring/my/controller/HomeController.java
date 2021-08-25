package org.spring.my.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.spring.my.service.MemberService;
import org.spring.my.service.NaverLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("home")
public class HomeController {
			
			@Autowired
			private MemberService memberService;
			
			@Autowired
			private NaverLoginService naverLoginService;
			
			@RequestMapping("main")
			public void main() {}
			
			@RequestMapping("index")
			public void index() {}
			
			//로그인폼으로이동
			@GetMapping("login")
			public void login(/* HttpSession session, Model model */) throws Exception{
				/*
				 * //apiUrl만들고 login이동 Map<String, String> resultMap =
				 * naverLoginService.getApiUrl(); session.setAttribute("state",
				 * resultMap.get("state")); model.addAttribute("apiURL",
				 * resultMap.get("apiURL"));
				 */			
				
			}
		
			
			
			@PostMapping("logincheck")
			public String login(String userid, String passwd, Model model, HttpSession session) throws Exception {
				// 0 : 로그인 완료 => 메인으로 이동
				// 1 : 아이디 미존재 =>로그인으로
				// 2 : 비밀번호 불일치 => 로그인으로
				
				Map<String, Object> resultMap = memberService.login(userid, passwd);
				if ((int)resultMap.get("rcode") == 0) {//로그인 성공
					session.setAttribute("userid", userid); //로그 아웃 전까진 세션에 저장된 정보를 사용 할 수 있음
																//메인으로 보냈을 때 정보를 활용하기 위해 설정해줌.
					return "redirect:main";
				}else {//로그인 실패
					
					model.addAttribute("resultMap", resultMap);
					return "home/login";
				}
				
				
				
			}
			
			@GetMapping("logout")
			public String logout(HttpSession session) {
				//로그인으로 했던 세션 삭제해서 로그아웃 하기
				session.invalidate(); //모든 세션변수 삭제											
				return "redirect:main";
			}
			
			@GetMapping("company")
			public String compaly() {
				return "home/company";
			}
			
			
			
}

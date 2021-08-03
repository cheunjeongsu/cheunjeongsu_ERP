package org.spring.my.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.my.dto.Member;
import org.spring.my.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("member")
public class MemberController {
			
	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//회원 추가 폼 이동
	@GetMapping("join")
	public void join() {}
	
	  //회원 정보 저장
	  @PostMapping("join") 
	  public void join(Member member, Model model, HttpSession session) throws Exception {
		  Map<String, Object> resultMap = memberService.insert(member);
		  //인증키를 세션에 넣기
		  //key:userid, value: authCode인 세션 생성
		
		  session.setAttribute(member.getUserid(), resultMap.get("authCode"));
		  session.setMaxInactiveInterval(60*60*2); //유효시간 설정
		  
		  
		  model.addAttribute("resultMap",resultMap);
		  
	 }
	  
	  //이메일에서 메일을 클릭 했을 때
	  @RequestMapping("joinConfirm")
	  public String joinConfirm(String userid, String authCode, HttpSession session) throws Exception {
		  logger.info("아이디:"+ userid);
			logger.info("joinConfirm:"+session.getId());
			String sessionAuthCode = (String)session.getAttribute(userid);
		  //인증키 검증
		  if (sessionAuthCode == null) {//세션기간이 종료되면 key사라짐
			  logger.info("세션기간만료");
			  return "redirect:/home/main";
		  }else if (sessionAuthCode.equals(authCode)) {
			  logger.info("인증성공");
			  //emailauth 1로 변경
			  memberService.updateEmailAuth(userid);
			  return "redirect:/home/login";
		  }else {
			  logger.info("인증키 일치 하지 않습니다.");
			  return "redirect:/home/main";
		  }
		  
		  
	  }
	 
	
		//주소팝업 폼으로 이동
		//get/post방식 
		// callback시 post방식으로 실행
		@RequestMapping("jusoPopup") 
		public void jusoPopup() {}
		
		//로그인한 회원의 정보를 가지고 이동
		@GetMapping("info")
		public void info(HttpSession session, Model model) throws Exception {
			String userid = (String)session.getAttribute("userid");
			Member member = memberService.selectOne(userid);
			model.addAttribute("member", member);
		}
	
		//아이디 체크
		@ResponseBody
		@RequestMapping("idCheck/{userid}")
		public Map<String,Object> idCheck(@PathVariable("userid") String userid) throws Exception{
			return memberService.idCheck(userid);
		}
		
	
	
}

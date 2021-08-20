package org.spring.my.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.my.dto.Member;
import org.spring.my.service.MailSendService;
import org.spring.my.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("member")
public class MemberController {
			
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MailSendService mailSendService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	//회원 추가 폼 이동
	@GetMapping("join")
	public void join() {	}
	
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
	  public String joinConfirm(String userid, String authCode, String email,  HttpSession session, RedirectAttributes rattr) {
			String sessionAuthCode = (String)session.getAttribute(userid);
			//인증키 검증
			if (sessionAuthCode == null) { //세션기간이 종료되면 key사라짐
				logger.info("세션기간 만료");
				return "redirect:/member/join";
			}else if (sessionAuthCode.equals(authCode)) {
				logger.info("인증성공");
				//emailauth 1로 변경
				//memberService.updateEmailAuth(userid);
				rattr.addFlashAttribute("userid", userid);
				rattr.addFlashAttribute("email", email);
				rattr.addFlashAttribute("emailCheckYn", "y");
				return "redirect:/member/join";
			}else {
				logger.info("인증키 일치 하지 않습니다.");
				return "redirect:/member/join";
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
		
		//이메일 전송
		@ResponseBody
		@RequestMapping("emailCheck")
		public String emailCheck(String userid, String email, HttpSession session) throws Exception{
			String authCode = mailSendService.sendAuthMail(email, userid);
			//인증키를 세션에 넣기
			//key:userid, value : authCode 인 세션생성
			session.setAttribute(userid , authCode);
			session.setMaxInactiveInterval(60*60*2);
			return "ok";
		}
		//멤버 리스트
		@RequestMapping("list")
		public String list(Model model) {
			List<Member> list =memberService.selectList();
			logger.info(list.toString());
			model.addAttribute("list", list);
			return "member/list";
		}
		//수정 폼으로 이동
		@RequestMapping(value = "modify", method = RequestMethod.GET)
		public String insert() {
			return "member/modify";
		}
	
}

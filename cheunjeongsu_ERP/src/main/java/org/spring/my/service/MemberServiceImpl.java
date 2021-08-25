package org.spring.my.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.spring.my.dao.MemberDAO;
import org.spring.my.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private FileService fileService;
	
	//암호화 위해서 자동주입(DI)
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MailSendService mailSendService;
	
	@Override
	public Map<String, Object> insert(Member member) throws Exception {
		Map<String, Object> resultMap= new HashMap<>();
		//중복아이디 체크
		//rcode, msg
		//0:사용가능 id, -1:중복된 id
		
		
		Member oldmember = memberDAO.selectOne(member.getUserid());
		if (oldmember != null) {
			resultMap.put("rcode", -1);
			resultMap.put("msg", "중복된 아이디입니다.");
			return resultMap; 
		}
		
		

		
		
		//1)파일 업로드
		String filename = fileService.fileUpload(member.getPhotofile());		
		member.setFilename(filename);		//실제 올려진 파일의 이름
	
		
		//2)비밀번호 암호화(평문을 암호화 함.)
		member.setPasswd(bCryptPasswordEncoder.encode(member.getPasswd()));
	
		
		//3)db에 저장
		memberDAO.insert(member);
		
		//4)이메일 전송 (인증키를 보내서 정상적인 사용자인지 확인)
//		String authCode = mailSendService.sendAuthMail(member.getEmail(), member.getUserid());
//		
//		
//		resultMap.put("authCode", authCode);
		resultMap.put("rcode", 0);
		resultMap.put("msg", "회원가입 완료");
		
		return resultMap; 		
	}

	@Override
	public Map<String, Object> login(String userid, String passwd) {
		Map<String, Object> resultMap= new HashMap<>();
		//0:로그인완료
		//1 아이디 미존재
		//2 비밀번호 불일치
		int rcode=0;
		String msg="";
		
		
		//회원 조회
		Member member = memberDAO.selectOne(userid);
		if (member ==null) {// 아이디 미존재
			rcode =1;
			msg= "아이디가 없습니다.";
		}else {
			//비밀번호 체크
			//매개변수 : 평문, 암호화된 비밀번호
			if (bCryptPasswordEncoder.matches(passwd, member.getPasswd())) {
				rcode=0;
				msg="로그인 완료";
			}else {
				rcode=2;
				msg="비밀번호 불일치";
			}
		}
		resultMap.put("rcode", rcode);
		resultMap.put("msg", msg);
		return resultMap;
	}

	//MemberList 조회
	@Override
	public List<Member> selectList() {
		return memberDAO.selectList();
	}
	
	@Override
	public Member selectOne(String userid) {
		// TODO Auto-generated method stub
		return 	memberDAO.selectOne(userid);
	}

	@Override
	public void updateEmailAuth(String userid) throws Exception {
		//이메일 인증 update
				memberDAO.updateEmailAuth(userid);
		
	}

	@Override
	public Map<String, Object> idCheck(String userid) {
		Map<String,Object> resultMap = new HashMap<>(); 
		//0:가능
		//1:불가능
		Member member =  memberDAO.selectOne(userid);
		int rcode=0;
		String msg ="";
		if (member == null) {
			rcode = 0;
			msg = "사용가능 아이디";
			
		}else {
			rcode = 1;
			msg = "사용 불 가능 아이디";
		}

		resultMap.put("rcode", rcode);
		resultMap.put("msg", msg);
		
		return resultMap;
	}

}

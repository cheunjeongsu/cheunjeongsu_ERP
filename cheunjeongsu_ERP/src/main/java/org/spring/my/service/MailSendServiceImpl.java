package org.spring.my.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class MailSendServiceImpl implements MailSendService {
	
	//root-context.xml에 만들어진 객체 자동 주입
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	
	//인증키 생성
	private String getAuthCode() {
		StringBuffer authCode = new StringBuffer();
		Random random = new Random();
		for(int i =0; i < 6; i++) {
				authCode.append(random.nextInt(10));
			
		}
			return authCode.toString();
	}
	
	//	이메일전송
	@Override
	public String sendAuthMail(String email, String userid) throws Exception {
		// 6자리 난수 인증번호 생성
		String authCode = getAuthCode();
		//보낼 메일 내용
		StringBuffer mailContent = new StringBuffer();
		mailContent.append("<h2>이메일 인증</h2>");
		mailContent.append(userid+"님. 아래 링크를 클릭하면 회원 가입 완료 됩니다.<br>");
		mailContent.append("<a href='http://localhost:8081/my/member/joinConfirm?userid=" + userid + "&authCode"+authCode + "'>이메일 인증 확인(여기를 눌러주세요)</a>");
		
		System.out.println(mailContent.toString());
		
		
		//인증메일 객체		
		MimeMessage mimeMsg = mailSender.createMimeMessage();
		mimeMsg.setSubject("회원가입 이메일 인증", "utf-8");
		mimeMsg.setText(mailContent.toString(), "utf-8", "html");
		mimeMsg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
		
		//메일 보내기
		mailSender.send(mimeMsg);
		
		
		return authCode;
	}
	

	

}

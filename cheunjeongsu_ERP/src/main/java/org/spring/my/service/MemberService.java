package org.spring.my.service;


import java.util.Map;

import org.spring.my.dto.Member;



public interface MemberService {
	public Map<String, Object> insert(Member member) throws Exception;
	
	public Map<String,Object> login(String userid, String passwd) throws Exception;

	public Member selectOne(String userid) throws Exception;
	public void updateEmailAuth(String userid) throws Exception;
	public Map<String, Object> idCheck(String userid);
	}

package org.spring.my.dao;

import java.util.Map;

import org.spring.my.dto.Member;


public interface MemberDAO {

	public void insert(Member member);

	public Member selectOne(String userid);

	public void updateEmailAuth(String userid);
	public void insertNaverLogin(Map<String, String> insertMap);
}

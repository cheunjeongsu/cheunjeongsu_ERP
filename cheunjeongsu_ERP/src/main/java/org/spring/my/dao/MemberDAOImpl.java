package org.spring.my.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAOImpl implements  MemberDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(Member member) {		
		sqlSession.insert("org.spring.my.MemberMapper.insert", member);
	}

	@Override
	public Member selectOne(String userid) {
		return sqlSession.selectOne("org.spring.my.MemberMapper.selectOne", userid);
		
	}

	@Override
	public void updateEmailAuth(String userid) {
		sqlSession.update("org.spring.my.MemberMapper.updateEmailAuth", userid);
		
	}
	
	//네이버 간편 가입
	@Override
	public void insertNaverLogin(Map<String, String> insertMap) {
		sqlSession.update("org.spring.my.MemberMapper.insertNaverLogin", insertMap);
	}
	
}

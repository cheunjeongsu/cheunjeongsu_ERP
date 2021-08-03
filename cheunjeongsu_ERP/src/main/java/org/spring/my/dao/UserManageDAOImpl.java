package org.spring.my.dao;



import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.UserManage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserManageDAOImpl implements UserManageDAO{
	@Autowired
	private SqlSession sqlSession; 
	
	@Override
	public UserManage selectOne(UserManage userManage) {
		return sqlSession.selectOne("org.spring.my.UserManageMapper.selectOne", userManage);
	}

	@Override
	public void insert(UserManage userManage) {
		sqlSession.selectOne("org.spring.my.UserManageMapper.insert", userManage);		
	}
	
	//좋아요, 싫어요
	@Override
	public int update(UserManage userManage) {
		return sqlSession.update("org.spring.my.UserManageMapper.update", userManage);		
		
	}

	@Override
	public int pUpdateReadCnt(UserManage userManage) {
		return sqlSession.update("org.spring.my.UserManageMapper.pUpdateReadCnt", userManage);
	}
	
	
	

}

package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(Reply reply) {
		sqlSession.insert("org.spring.my.ReplyMapper.insert", reply);	
	}

	@Override
	public void updateRestep(Reply reply) {
		sqlSession.update("org.spring.my.ReplyMapper.updateRestep", reply);
	}

	@Override
	public List<Map<String,Object>> selectList(Map<String, Object> findmap) {
		return sqlSession.selectList("org.spring.my.ReplyMapper.selectList", findmap);
	}

	@Override
	public void update(Reply reply) {
		sqlSession.update("org.spring.my.ReplyMapper.update", reply);		
	}

	@Override
	public void delete(int rnum) {
		sqlSession.delete("org.spring.my.ReplyMapper.update", rnum);		
	}
	//좋아요+1
	@Override
	public void updateLikeCnt(int rnum) {
		sqlSession.update("org.spring.my.ReplyMapper.updateLikeCnt", rnum);
		
	}
	//좋아요-1
	@Override
	public void updateLikeCntCancel(int rnum) {
		sqlSession.update("org.spring.my.ReplyMapper.updateLikeCntCancel", rnum);
		
	}
	//싫어요+1
	@Override
	public void updateDisLikeCnt(int rnum) {
		sqlSession.update("org.spring.my.ReplyMapper.updateDisLikeCnt", rnum);
	}
	
	//싫어요-1
	@Override
	public void updateDisLikeCntCancel(int rnum) {
		sqlSession.update("org.spring.my.ReplyMapper.updateDisLikeCntCancel", rnum);
	}

}

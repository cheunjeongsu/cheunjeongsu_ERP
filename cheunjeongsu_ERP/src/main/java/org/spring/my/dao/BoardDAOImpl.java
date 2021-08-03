package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Board;
import org.spring.my.dto.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<Map<String,Object>> selectList(Page page) throws Exception {
		return sqlSession.selectList("org.spring.my.BoardMapper.selectList", page);
	}
	

	@Override
	public Map<String,Object> selectOne(Map<String, Object> findmap) throws Exception {
		return sqlSession.selectOne("org.spring.my.BoardMapper.selectOne", findmap);
	}

	
	@Override
	public void insert(Board board) throws Exception {
		sqlSession.insert("org.spring.my.BoardMapper.insert", board);
	}
	
	@Override
	public void update(Board board) throws Exception {
		sqlSession.update("org.spring.my.BoardMapper.update", board);
	}
	
	@Override
	public void delete(int bnum) throws Exception {
		sqlSession.update("org.spring.my.BoardMapper.delete", bnum);
	}

	//전체 게시물 갯수 구하기
	@Override
	public int selectTotCnt(Page page) throws Exception {
		return  sqlSession.selectOne("org.spring.my.BoardMapper.selectTotCnt", page);
	}

	@Override
	public void updateReadCnt(int bnum) throws Exception {
		sqlSession.update("org.spring.my.BoardMapper.updateReadCnt", bnum);
		
	}

	
	
	//좋아요 +1
	@Override
	public void updateLikeCnt(int bnum) throws Exception {
	
		sqlSession.update("org.spring.my.BoardMapper.updateLikeCnt", bnum);
	}

	//좋아요 -1
	@Override
	public void updateLikeCntCancel(int bnum) throws Exception {
		sqlSession.update("org.spring.my.BoardMapper.updateLikeCntCancel", bnum);
	}

	//싫어요 +1
	@Override
	public void updateDisLikeCnt(int bnum) throws Exception {
		sqlSession.update("org.spring.my.BoardMapper.updateDisLikeCnt", bnum);
		
	}

	//싫어요 -1
	@Override
	public void updateDisLikeCntCancel(int bnum) throws Exception {
		sqlSession.update("org.spring.my.BoardMapper.updateDisLikeCntCancel", bnum);
	}


}

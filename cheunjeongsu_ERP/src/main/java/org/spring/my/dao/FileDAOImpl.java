package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.BoardFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAOImpl implements FileDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertBoardFiles(Map<String, Object> filesMap) {
		sqlSession.insert("org.spring.my.BoardFileMapper.insertBoardFiles", filesMap);
		
	}

	@Override
	public List<BoardFile> selectList(int bnum) {
		return sqlSession.selectList("org.spring.my.BoardFileMapper.selectList", bnum);
	}

	@Override
	public void delete(int fnum) {
		sqlSession.delete("org.spring.my.BoardFileMapper.delete", fnum);
		
	}

}

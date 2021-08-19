package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Board;
import org.spring.my.dto.BoardFile;
import org.spring.my.dto.Page;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardDAO {
		
	public void insert(Board board) throws Exception;
	public Map<String,Object> selectOne(Map<String, Object> findmap) throws Exception;
	public void update(Board board) throws Exception;
	public void delete(int bnum) throws Exception;
	public List<Map<String,Object>> selectList(Page page) throws Exception;
	public int selectTotCnt(Page page) throws Exception;
	public void updateReadCnt(int bnum) throws Exception;
	public void updateLikeCnt(int bnum) throws Exception;
	public void updateLikeCntCancel(int bnum) throws Exception;
	public void updateDisLikeCnt(int bnum) throws Exception;
	public void updateDisLikeCntCancel(int bnum) throws Exception;
	
}

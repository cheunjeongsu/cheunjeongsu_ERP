package org.spring.my.service;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Board;
import org.spring.my.dto.BoardFile;
import org.spring.my.dto.Page;



public interface BoardService {

	public void insert(Board board) throws Exception;
	public void delete(int bnum) throws Exception;
	public List<Map<String,Object>> selectList(Page page) throws Exception;
	
	public Map<String, Object> selectOne(int bnum, String userid) throws Exception;

	public void updateReadCnt(int bnum,String userid) throws Exception;
	public void updateLikeCnt(int bnum, String userid) throws Exception;
	public void updateLikeCntCancel(int bnum, String userid) throws Exception;
	public void updateDisLikeCnt(int bnum, String userid) throws Exception;
	public void updateDisLikeCntCancel(int bnum,String userid) throws Exception;
	
	public void update(Board board, List<Integer> fileDeleteList) throws Exception;
	


	
}

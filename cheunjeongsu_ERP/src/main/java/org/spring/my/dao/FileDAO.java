package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.BoardFile;

public interface FileDAO {
	public void insertBoardFiles(Map<String,Object> filesMap);

	public List<BoardFile> selectList(int bnum);	
	public void delete(int fnum);


	

}

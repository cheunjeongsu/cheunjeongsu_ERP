package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Reply;

public interface ReplyDAO {
	public void insert(Reply reply);
	public void updateRestep(Reply reply);
	public List<Map<String,Object>> selectList(Map<String, Object> findmap);
	public void update(Reply reply);
	public void delete(int rnum);
	public void updateLikeCnt(int rnum);
	
	public void updateLikeCntCancel(int rnum);
	
	public void updateDisLikeCnt(int rnum);
	
	public void updateDisLikeCntCancel(int rnum);	
}

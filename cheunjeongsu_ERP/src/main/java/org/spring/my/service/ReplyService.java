package org.spring.my.service;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Reply;

public interface ReplyService {

	public void insert(Reply reply);
	
	public List<Map<String,Object>> selectList(int bnum, String userid);

	public void update(Reply reply);

	public void delete(int rnum);

	public void updateLikeCnt(int rnum, String userid);
	
	public void updateLikeCntCancel(int rnum, String userid);
	
	public void updateDisLikeCnt(int rnum, String userid);
	
	public void updateDisLikeCntCancel(int rnum, String userid);
	
}

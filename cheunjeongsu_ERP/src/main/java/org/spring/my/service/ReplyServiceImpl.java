package org.spring.my.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.spring.my.dao.ReplyDAO;
import org.spring.my.dao.UserManageDAO;
import org.spring.my.dto.Reply;
import org.spring.my.dto.UserManage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;
	@Autowired
	private UserManageDAO userManageDAO;

	
	@Transactional
	@Override
	public void insert(Reply reply) {
		//view에서 받은 데이터는 부모의 정보
		//글 순서 +1
		reply.setRestep(reply.getRestep()+1);
		//현재추가하고자 하는 글의 순서보다 크거나 같은 데이터는 update
		replyDAO.updateRestep(reply);
		
		
		
		//글의 레벨+1
		reply.setRelevel(reply.getRelevel()+1);
		
		
		//추가
		replyDAO.insert(reply);
		
		
	}




	@Override
	public List<Map<String,Object>> selectList(int bnum, String userid) {
		Map<String, Object> findmap = new HashMap<>();
		findmap.put("bnum", bnum);
		findmap.put("userid", userid);
		
		return replyDAO.selectList(findmap);
	}




	@Override
	public void update(Reply reply) {
		replyDAO.update(reply);
		
	}




	@Override
	public void delete(int rnum) {
		
		replyDAO.delete(rnum);
	}
	//좋아요 + 1
		@Override
		public void updateLikeCnt(int rnum, String userid) {
			//1)reply =>likecnt + 1
			replyDAO.updateLikeCnt(rnum);
			
			//2)usermanage => state 1 추가
			UserManage userManage = new UserManage();
			userManage.setGubun("2"); //1:게시글, 2:댓글
			userManage.setNum(rnum); //게시글또는 댓글의 번호
			userManage.setUserid(userid); //회원ID
			userManage.setState("1"); //0:조회, 1:좋아요, 2:싫어요
		
			int cnt = userManageDAO.update(userManage);
			if (cnt == 0) userManageDAO.insert(userManage); //업데이트가 안됐다면 추가
			
		}

		//좋아요-1
		@Override
		public void updateLikeCntCancel(int rnum, String userid) {
			//1)reply =>likecnt - 1
			replyDAO.updateLikeCntCancel(rnum);
			
			//2)usermanage => state 0 변경 
			UserManage userManage = new UserManage();
			userManage.setGubun("2"); //1:게시글, 2:댓글
			userManage.setNum(rnum); //게시글또는 댓글의 번호
			userManage.setUserid(userid); //회원ID
			userManage.setState("0"); //0:조회, 1:좋아요, 2:싫어요
		
			int cnt = userManageDAO.update(userManage);
		}

		//싫어요+1
		@Override
		public void updateDisLikeCnt(int rnum, String userid) {
			//1)reply =>dislikecnt + 1
			replyDAO.updateDisLikeCnt(rnum);
			
			//2)usermanage => state 2 추가
			UserManage userManage = new UserManage();
			userManage.setGubun("2"); //1:게시글, 2:댓글
			userManage.setNum(rnum); //게시글또는 댓글의 번호
			userManage.setUserid(userid); //회원ID
			userManage.setState("2"); //0:조회, 1:좋아요, 2:싫어요
		
			int cnt = userManageDAO.update(userManage);
			if (cnt == 0) userManageDAO.insert(userManage); //업데이트가 안됐다면 추가
			
		}

		//싫어요-1
		@Override
		public void updateDisLikeCntCancel(int rnum, String userid) {
			//1)reply =>dislikecnt - 1
			replyDAO.updateDisLikeCntCancel(rnum);
			
			//2)usermanage => state 0으로 변경
			UserManage userManage = new UserManage();
			userManage.setGubun("2"); //1:게시글, 2:댓글
			userManage.setNum(rnum); //게시글또는 댓글의 번호
			userManage.setUserid(userid); //회원ID
			userManage.setState("0"); //0:조회, 1:좋아요, 2:싫어요
		
			int cnt = userManageDAO.update(userManage);
			
		}
	
}

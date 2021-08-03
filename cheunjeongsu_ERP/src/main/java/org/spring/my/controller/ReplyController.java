package org.spring.my.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.spring.my.dto.Reply;
import org.spring.my.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("reply")
public class ReplyController {
	@Autowired
	private ReplyService replyService; 
	
	//덧글 추가
	@ResponseBody
	@RequestMapping(value="/", method=RequestMethod.POST)
	public String add(@RequestBody Reply reply,
			HttpSession session, HttpServletRequest request) {
		String userid = (String)session.getAttribute("userid");
		reply.setUserid("java");
		reply.setIp(request.getRemoteAddr());
		replyService.insert(reply);
		return "ok";
	}
	
	//덧글 리스트 조회
	@ResponseBody
	@RequestMapping(value="/list/{bnum}", method = RequestMethod.GET)
	public List<Map<String,Object>> list(@PathVariable("bnum") int bnum, HttpSession session){
		String userid =(String)session.getAttribute("userid");
		//댓글 조회
		List<Map<String,Object>> replist = replyService.selectList(bnum, userid);
		return replist;
	}
	
	//덧글수정
		@ResponseBody
		@RequestMapping(value="/{rnum}", method = {RequestMethod.PUT,RequestMethod.PATCH} ,
					produces="application/text; charset=utf-8")
		public String modify(@RequestBody Reply reply){
			replyService.update(reply);
			return "수정완료";
		}
		
	//덧글 삭제
		@ResponseBody
		@RequestMapping(value="/{rnum}", method = RequestMethod.DELETE,
				produces="application/text; charset=utf-8")
		public String delete(@PathVariable("rnum") int rnum){
			
			replyService.delete(rnum);
			return "삭제완료";
		}
		//좋아요
		@GetMapping("like/{rnum}")
		public String like(@PathVariable("rnum") int rnum, HttpSession session) {
			String userid = (String)session.getAttribute("userid");
			replyService.updateLikeCnt(rnum, userid);
			return "ok";
		}
		
		//좋아요 취소
		@GetMapping("likeCancel/{rnum}")
		public String likeCancel(@PathVariable("rnum") int rnum, HttpSession session) {
			String userid = (String)session.getAttribute("userid");
			replyService.updateLikeCntCancel(rnum, userid);
			return "ok";
		}

		//싫어요
		@GetMapping("disLike/{rnum}")
		public String disLike(@PathVariable("rnum") int rnum, HttpSession session) {
			String userid = (String)session.getAttribute("userid");
			replyService.updateDisLikeCnt(rnum, userid);
			return "ok";
		}	
		
		//싫어요 취소
		@GetMapping("disLikeCancel/{rnum}")
		public String disLikeCancel(@PathVariable("rnum") int rnum, HttpSession session) {
			String userid = (String)session.getAttribute("userid");
			replyService.updateDisLikeCntCancel(rnum, userid);
			return "ok";
		}

	
}

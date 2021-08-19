package org.spring.my.controller;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.spring.my.dto.Board;
import org.spring.my.dto.BoardFile;
import org.spring.my.dto.Page;
import org.spring.my.service.BoardService;
import org.spring.my.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@RequestMapping("board")
@SessionAttributes("page")//@ModelAttributes에도 page를 담는다
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private FileService fileService;
	
	@GetMapping("add")
	public void add()	{}
	
	@PostMapping("add")
	public String add(Board board, HttpServletRequest request) throws Exception{
		
		board.setIp(request.getRemoteAddr()); //사용자 ip
		boardService.insert(board);
		
		return "redirect:list";
		
	}
	//세션생성
	@RequestMapping("/")
	public String home(Page page, Model model) throws Exception{
		//모델을 생성해서 @SessionAttributes 에 생성
		model.addAttribute("page", page);		

		
		return "redirect:list";		
	}
	
	
	//리스트 조회 후 이동(주소 변경)
	//리스트조회후 폼으로 이동
	//@ModelAttribute("page") : 1) view까지 page를 전달
									//2) @SessionAttributes 존재시 session에도 저장
	@GetMapping("list")
	public void list(@ModelAttribute("page") Page page, Model model, BoardFile boardfile) throws Exception {
		List<Map<String,Object>> blist = boardService.selectList(page);

		model.addAttribute("blist", blist);
		System.out.println(blist);
		
	}
	
	//상세조회 폼으로 이동
	@GetMapping("detail")
	public void detail(int bnum, Model model, HttpSession session) throws Exception {
		
		//조회수 +1
		String userid =(String)session.getAttribute("userid");
				boardService.updateReadCnt(bnum, userid);
		//한 건 조회
		Map<String, Object> boardMap = boardService.selectOne(bnum, userid);
		
		model.addAttribute("boardMap", boardMap);
		
		System.out.println(boardMap);
		
	}
	
	//좋아요	
	@ResponseBody
	@GetMapping("like/{bnum}")
	public String like(@PathVariable("bnum") int bnum, HttpSession session)  throws Exception{
		String userid = (String)session.getAttribute("userid");
		boardService.updateLikeCnt(bnum, "bulgom");
		return "ok"; 
	}
	
	//좋아요 취소
		@ResponseBody
		@GetMapping("likeCancel/{bnum}")
		public String likeCancel(@PathVariable("bnum") int bnum, HttpSession session) throws Exception {
			String userid = (String)session.getAttribute("userid");
			boardService.updateLikeCntCancel(bnum, userid);
			return "ok";
		}
		//싫어요
		@ResponseBody
		@GetMapping("disLike/{bnum}")
		public String disLike(@PathVariable("bnum") int bnum, HttpSession session) throws Exception {
			String userid = (String)session.getAttribute("userid");
			boardService.updateDisLikeCnt(bnum, userid);
			return "ok";
		}
		
		//싫어요 취소
		@ResponseBody
		@GetMapping("disLikeCancel/{bnum}")
		public String disLikeCancel(@PathVariable("bnum") int bnum, HttpSession session) throws Exception {
			String userid = (String)session.getAttribute("userid");
			boardService.updateDisLikeCntCancel(bnum, userid);
			return "ok";
		}
		//게시물삭제(removeyn을 'y'로 변경')
		@GetMapping("delete")
		public String remove(int bnum) throws Exception {
			boardService.delete(bnum);
			return "redirect:list";
		}
		//게시물 수정 폼 이동
		@GetMapping("modify")
		public String modify(int bnum, Model model, HttpSession session) throws Exception {
			//한 건 조회
			String userid = (String)session.getAttribute("userid");
			Map<String, Object> boardMap = boardService.selectOne(bnum, userid);
			
			model.addAttribute("boardMap",boardMap);
			
			return "board/modify";
			
		}
		
		//게시물 수정
		//required = false : 데이터가 없을수도 있다
		@PostMapping("modify")
		public String modify(Board board, 
				@RequestParam(value="fileDelete", required = false) List<Integer> fileDeleteList,
				HttpServletRequest request) throws Exception {
			
			//ip구하기
			board.setIp(request.getRemoteAddr());
			boardService.update(board, fileDeleteList);
			
			return "redirect:list";
		}
	
		@RequestMapping("filedownload")
		public void filedownload(String filename, HttpServletResponse response) throws Exception {
			fileService.fileDownload(filename, response);
		}
		
		
}


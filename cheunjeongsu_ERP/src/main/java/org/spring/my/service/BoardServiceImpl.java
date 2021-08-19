package org.spring.my.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.spring.my.dao.BoardDAO;
import org.spring.my.dao.FileDAO;
import org.spring.my.dao.UserManageDAO;
import org.spring.my.dto.Board;
import org.spring.my.dto.BoardFile;
import org.spring.my.dto.Page;
import org.spring.my.dto.UserManage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	private FileDAO fileDAO;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private UserManageDAO userManageDAO;
	
	//메소드 단위로 트랜잭션 설정
		@Transactional
		@Override
		public void insert(Board board) throws Exception{
			//게시물 저장
			boardDAO.insert(board);//게시물저장후엔 bnum 값 있음
			
			//파일을 업로드 하고 db에 저장
			fileService.insertBoardFiles(board.getBnum(),board.getFiles());

		}


	@Override
	public List<Map<String,Object>> selectList(Page page)  throws Exception {
		//page 값 구하기
		//전체 게시물수 
		int totCnt = boardDAO.selectTotCnt(page);
		//전체페이지수
		int totPage = totCnt / page.getPerPage();
		if (totCnt % page.getPerPage()!=0 ) totPage += 1;
		page.setTotPage(totPage);
		
		//현재 페이지
		int curPage = page.getCurPage();
		//시작번호
		int startNum = (curPage-1) * page.getPerPage() + 1;
		page.setStartNum(startNum);
		
		//끝번호
		int endNum = startNum + page.getPerPage() -1;
		page.setEndNum(endNum);
		
		//시작페이지
		int startPage = curPage - ((curPage-1) %page.getPerBlock());
		page.setStartPage(startPage);
		
		//끝페이지
		int endPage = startPage + page.getPerBlock() -1;
		if (endPage > totPage) endPage = totPage;
		page.setEndPage(endPage);
		
		return boardDAO.selectList(page);
	}

	@Override
	public Map<String, Object> selectOne(int bnum, String userid)  throws Exception{
		//게시물 한건조회
		Map<String, Object> findmap = new HashMap<>();
		findmap.put("bnum", bnum);
		findmap.put("userid", userid);
		Map<String, Object> board = boardDAO.selectOne(findmap);
		//게시물의 파일들 조회
		List<BoardFile> bflist = fileDAO.selectList(bnum);
		Map<String, Object> boardMap = new HashMap<>();
		boardMap.put("board", board);
		boardMap.put("bflist", bflist);
				
		return boardMap;
	}
	
	//조회수 + 1
	@Transactional
	@Override
	public void updateReadCnt(int bnum, String userid) throws Exception {
		//유저테이블에 데이터가 없다면 insert 하고 readCnt +1
		UserManage userManage = new UserManage();
		userManage.setGubun("1"); //1:게시글, 2:댓글
		userManage.setNum(bnum); //게시글또는 댓글의 번호
		userManage.setUserid(userid); //회원ID
		userManage.setState("0"); //0:조회, 1:좋아요, 2:싫어요
		
		if (userManageDAO.selectOne(userManage) == null) {
			boardDAO.updateReadCnt(bnum);	
			userManageDAO.insert(userManage);
		}
		
		//프로시저를 이용하여 db처리
		//userManageDAO.pUpdateReadCnt(userManage);
		
	}

	//좋아요 처리
	@Transactional
	@Override
	public void updateLikeCnt(int bnum, String userid) throws Exception {
		//1)board =>likecnt + 1
		boardDAO.updateLikeCnt(bnum);
		
		//2)usermanage => state 1 변경
		UserManage userManage = new UserManage();
		userManage.setGubun("1"); //1:게시글, 2:댓글
		userManage.setNum(bnum); //게시글또는 댓글의 번호
		userManage.setUserid(userid); //회원ID
		userManage.setState("1"); //0:조회, 1:좋아요, 2:싫어요
	
		userManageDAO.update(userManage);

	}
	//좋아요 취소
	@Transactional
	@Override
	public void updateLikeCntCancel(int bnum, String userid) throws Exception {
		//1)board =>likecnt - 1
		boardDAO.updateLikeCntCancel(bnum);
		
		//2)usermanage => state 0 변경
		UserManage userManage = new UserManage();
		userManage.setGubun("1"); //1:게시글, 2:댓글
		userManage.setNum(bnum); //게시글또는 댓글의 번호
		userManage.setUserid(userid); //회원ID
		userManage.setState("0"); //0:조회, 1:좋아요, 2:싫어요
	
		userManageDAO.update(userManage);
		
	}
	
	//싫어요 
	@Transactional
	@Override
	public void updateDisLikeCnt(int bnum, String userid)  throws Exception{
		//1)board =>dislikecnt + 1
		boardDAO.updateDisLikeCnt(bnum);
		
		//2)usermanage => state 1 변경
		UserManage userManage = new UserManage();
		userManage.setGubun("1"); //1:게시글, 2:댓글
		userManage.setNum(bnum); //게시글또는 댓글의 번호
		userManage.setUserid(userid); //회원ID
		userManage.setState("2"); //0:조회, 1:좋아요, 2:싫어요
	
		userManageDAO.update(userManage);
		
	}

	//싫어요 취소
	@Transactional
	@Override
	public void updateDisLikeCntCancel(int bnum, String userid) throws Exception {
		//1)board =>dislikecnt - 1
		boardDAO.updateDisLikeCntCancel(bnum);
		
		//2)usermanage => state 0 변경
		UserManage userManage = new UserManage();
		userManage.setGubun("1"); //1:게시글, 2:댓글
		userManage.setNum(bnum); //게시글또는 댓글의 번호
		userManage.setUserid(userid); //회원ID
		userManage.setState("0"); //0:조회, 1:좋아요, 2:싫어요
	
		userManageDAO.update(userManage);
		
	}

	@Override
	public void delete(int bnum) throws Exception {
		boardDAO.delete(bnum);
		
	}

	@Transactional
	@Override
	public void update(Board board, List<Integer> fileDeleteList) throws Exception {
		//게시물수정
		boardDAO.update(board);
		
		//기존파일 삭제
		if (fileDeleteList != null) {
			for(int fnum : fileDeleteList) {
				fileDAO.delete(fnum);
			}
		}
		
		//파일 추가
		//파일을 업로드 하고 db에 저장
		fileService.insertBoardFiles(board.getBnum(),board.getFiles());
		
	}
	
	

}

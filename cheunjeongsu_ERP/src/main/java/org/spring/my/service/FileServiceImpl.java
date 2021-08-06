package org.spring.my.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.my.dao.FileDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileServiceImpl implements FileService{
	
	private static final Logger logger = LoggerFactory.getLogger(FileServiceImpl.class);
	
	//root-context.xml에 bean생성하고 자동주입
	@Autowired
	private String uploadDir;
	@Autowired
	private FileDAO fileDAO;
	

	//공통모듈
	//파일을 폴더에 저장하고 파일명을 리턴 
	@Override
	public String fileUpload(MultipartFile file) {		
		//실제파일이름
		String originfilename = file.getOriginalFilename();
		if (originfilename == "")	return ""; //파일이 없다면 return
	
		//파일 이름을 겹치지 않도록 파일 이름 생성
		String filename = System.currentTimeMillis()+originfilename;
		File f = new File(uploadDir, filename);
		try {
			file.transferTo(f); //파일 폴더에 저장
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return filename;
		
	}


	@Override
	public void insertBoardFiles(int bnum, List<MultipartFile> files) {
		//매퍼에게 전달할 맵
		Map<String,Object> filesMap = new HashMap<>();
		filesMap.put("bnum", bnum);
		
		//파일명 리스트만들기
		List<String> filenamelist = new ArrayList<>();

		if (files == null) return ; 
		for(MultipartFile mf:files) {
			//파일업로드
			String filename = fileUpload(mf);
			if (!filename.equals("")) filenamelist.add(filename);
		}
		if (filenamelist.size() == 0) return ;
		filesMap.put("filenamelist", filenamelist);
		//db에 파일명 저장
		fileDAO.insertBoardFiles(filesMap);

		
	}
	
	//파일 다운로드
		@Override
		public void fileDownload(String filename, HttpServletResponse response) throws Exception {
				//다운로드 폴더
				String fileUrl = uploadDir+ "/" + filename;
				
				//파일 읽기 스트림 생성
				FileInputStream fis = new FileInputStream(fileUrl);
				//응답객체의 헤더설정 변경:첨부파일형태로
				response.setHeader("Content-Disposition", "attachment;filename="+filename);
				//파일 보내기 스트림 생성
				OutputStream out = response.getOutputStream();
				//fis 읽어서 out에 내보냄
				FileCopyUtils.copy(fis,  out);
				
		}
	

}

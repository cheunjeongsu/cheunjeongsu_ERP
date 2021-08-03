package org.spring.my.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface FileService {
	//파일을 폴더에 저장하고 파일명을 리턴 
	public String fileUpload(MultipartFile file);
	//파일들을 db에 저장
	public void insertBoardFiles(int bnum, List<MultipartFile> files);
}

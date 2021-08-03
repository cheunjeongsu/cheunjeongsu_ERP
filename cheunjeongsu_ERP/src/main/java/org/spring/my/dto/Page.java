package org.spring.my.dto;

import lombok.Data;

@Data
public class Page {
	private int curPage = 1; //현재페이지
	private int perPage = 10; //한페이지당 게시물수
	private int perBlock = 10; //한화명의 페이지수
	
	private int totPage; //전체페이지수 
	private int startNum; //시작번호
	private int endNum; //끝번호
	private int startPage; //시작페이지
	private int endPage; //끝페이지
	
	private String findkey; //검색키
	private String findvalue; //검색값
}

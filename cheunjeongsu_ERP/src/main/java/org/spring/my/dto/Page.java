package org.spring.my.dto;

import lombok.Data;

@Data
public class Page {
	private int curPage = 1; //현재 페이지
	private int perPage = 8; //한 페이지당 게시물수
	private int perBlock = 2; //한 화면의 페이지수
	
	private int totPage; //전체페이지수 
	private int startNum; //시작번호
	private int endNum; //끝번호
	private int startPage; //시작페이지
	private int endPage; //끝페이지
	
	private String findkey; //검색키
	private String findvalue; //검색값
}

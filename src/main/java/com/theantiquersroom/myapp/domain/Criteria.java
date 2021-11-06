package com.theantiquersroom.myapp.domain;

import lombok.Data;


@Data
public class Criteria {

	// 1. 현재 보고자 하는 페이지 번호
	private Integer currPage=1;
	
	// 2. 한 페이지당 보여줄 레코드 개수
	private Integer amount=10;
	
	//3. 한 화면당 보여줄 페이지 번호 목록의 길이
	private Integer pagesPerPage=20;
	
} // end class

package com.theantiquersroom.myapp.domain;

import lombok.Data;


@Data
public class MypageCriteria {

	// 1. 현재 보고자 하는 페이지 번호
	private Integer currPage=1;
	
	// 2. 한 페이지당 보여줄 레코드 개수
	private Integer amount=7;
	
	//3. 한 화면당 보여줄 페이지 번호 목록의 길이
	private Integer pagesPerPage=5;
	
	//4. limit 구문에서 시작 부분에 필요한 값을 반환(mybatis에서 사용)
	public Integer getPageStart() {return (this.currPage -1) * this.amount;}
	
	//5. 키워드 검색
	public String keyword;
	
	//6. 경매상태 필터
	public String status;
	
} // end class

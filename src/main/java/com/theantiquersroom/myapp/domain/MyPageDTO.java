package com.theantiquersroom.myapp.domain;

import lombok.Data;


@Data
public class MyPageDTO {

	private MypageCriteria cri;			// 현재 브라우저 화면에서 전송하는 파라미터 수집
	
	private int totalAmount;		// 총 레코드 건수

	private int startPage;			// 한 페이지당 페이지목록의 시작번호
	private int endPage;			// 한 패이지당 페이지목록의 끝번호
	private int realEndPage;		// 총 레코드 건수에 기반한 총 페이지 수
	
	private int offset;				// 현재 페이지에 해당하는 레코드의 시작번호
	
	private boolean prev;			// 다음 페이지목록의 존재여부
	private boolean next;			// 이전 페이지목록의 존재여부
	
	
	public MyPageDTO(MypageCriteria cri, int totalAmount) {
		this.cri = cri;
		
		this.totalAmount = totalAmount;
		
		//----------------------------------------------------------//
		//--Step.0 : 페이징 처리를 위한 공통변수 생성하기
		//----------------------------------------------------------//
		int currPage = cri.getCurrPage();
		int amount = cri.getAmount();
		int pagesPerPage = cri.getPagesPerPage();

		//----------------------------------------------------------//
		//--Step.1 : 현재 페이지에서 보여줄 페이지목록의 끝페이지번호 구하기
		//----------------------------------------------------------//
		this.endPage = (int) Math.ceil( (currPage * 1.0) / pagesPerPage ) * pagesPerPage;

		//----------------------------------------------------------//
		//--Step.3 : 현재 페이지의 페이지번호목록의 시작번호 구하기
		//----------------------------------------------------------//
		this.startPage = this.endPage - ( pagesPerPage - 1 );

		//----------------------------------------------------------//
		//--Step.4 : 총페이지수 구하기
		//----------------------------------------------------------//
		this.realEndPage = (int) Math.ceil( (totalAmount * 1.0) / amount );
		
		if(this.realEndPage < this.endPage) {
			this.endPage = this.realEndPage;
		} // if

		//----------------------------------------------------------//
		//--Step.5 : 이전 페이지번호목록으로 이동가능여부(prev) 구하기
		//----------------------------------------------------------//
		this.prev = this.startPage > 1;

		//----------------------------------------------------------//
		//--Step.6 : 다음 페이지번호목록으로 이동가능여부(next) 구하기
		//----------------------------------------------------------//
		this.next = this.endPage < realEndPage;

		//----------------------------------------------------------//
		//--Step.7 : 현재 페이지에 표시할 목록의 시작 offset 구하기
		//----------------------------------------------------------//
		this.offset = ( currPage - 1 ) * amount;

	} // constructor
	
} // end class

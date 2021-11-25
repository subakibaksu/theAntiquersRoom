package com.theantiquersroom.myapp.mapper;

import java.util.List;

import com.theantiquersroom.myapp.domain.BoardQnACriteria;
import com.theantiquersroom.myapp.domain.QnADTO;

public interface BoardMapper {
	
	/* 문의게시판 등록 */
	public Integer registerQnA(QnADTO dto);
	
	/* 문의게시판 목록 */
	public List<QnADTO> getQnAList();
	
	/* 문의게시판 목록(페이징 적용) */
	public List<QnADTO> getQnAListPaging(BoardQnACriteria cri);
	
	/* 문의게시판 총 갯수 */
	public int getQnATotal();
	
	/* 문의게시판 조회 */
	public QnADTO getQnADetail(int bindex);
	
	/* 문의게시판 수정 */
	public Integer modifyQnA(QnADTO dto);
	
	/* 문의게시판 수정 */
	public Integer removeQnA(int bindex);
    
    /* 게시판 - 답글 등록 */
    public int registerReQnA(QnADTO dto);

} // end class

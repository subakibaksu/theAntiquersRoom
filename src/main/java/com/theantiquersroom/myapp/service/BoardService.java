package com.theantiquersroom.myapp.service;

import java.util.List;

import com.theantiquersroom.myapp.domain.BoardQnACriteria;
import com.theantiquersroom.myapp.domain.QnADTO;

public interface BoardService {

	 /* 문의게시판 등록 */
	public abstract boolean registerQnA(QnADTO dto);
	
	 /* 문의게시판 목록 */
	public abstract List<QnADTO> getQnAList();

	 /* 문의게시판 목록(페이징 적용) */
    	public List<QnADTO> getQnAListPaging(BoardQnACriteria cri);

   	 /* 문의게시판 총 갯수 */
  	public int getQnATotal();

}

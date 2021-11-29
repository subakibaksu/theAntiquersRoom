package com.theantiquersroom.myapp.mapper;

import java.util.List;

import com.theantiquersroom.myapp.domain.BoardQnACriteria;
import com.theantiquersroom.myapp.domain.BoardReviewCriteria;
import com.theantiquersroom.myapp.domain.QnADTO;
import com.theantiquersroom.myapp.domain.ReviewDTO;

public interface BoardMapper {
	
	/* 문의게시판 등록 */
	public Integer registerQnA(QnADTO dto);
	
	/* 문의게시판 목록 */
	public List<QnADTO> getQnAList();
	
	/* 문의게시판 목록(페이징 적용) */
	public List<QnADTO> getQnAListPaging(BoardQnACriteria cri);
	
	/* 문의게시판 총 갯수 */
	public Integer getQnATotal();
	
	/* 문의게시판 조회 */
	public QnADTO getQnADetail(int bindex);
	
	/* 문의게시판 수정 */
	public Integer modifyQnA(QnADTO dto);
	
	/* 문의게시판 수정 */
	public Integer removeQnA(int bindex);
    
   	/* 게시판 - 답글 등록 */
   	public Integer registerReQnA(QnADTO dto);

   	/* ========================== 리뷰게시판 ============================ */
   	
	/* 리뷰게시판 등록 */
	public Integer registerReview(ReviewDTO dto);
	
	/* 리뷰게시판 목록 */
	public List<ReviewDTO> getReviewList();
	
	/* 리뷰게시판 목록(페이징 적용) */
	public List<ReviewDTO> getReviewListPaging(BoardReviewCriteria cri);
	
	/* 리뷰게시판 총 갯수 */
	public Integer getReviewTotal();
	
	/* 리뷰게시판 조회 */
	public ReviewDTO getReviewDetail(int reviewId);
	
	/* 리뷰게시판 수정 */
	public Integer modifyReview(ReviewDTO dto);
	
	/* 리뷰게시판 수정 */
	public Integer removeReview(int reviewId);
	
} // end class

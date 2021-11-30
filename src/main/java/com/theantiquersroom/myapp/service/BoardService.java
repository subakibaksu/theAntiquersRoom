package com.theantiquersroom.myapp.service;

import java.util.List;

import com.theantiquersroom.myapp.domain.BoardQnACriteria;
import com.theantiquersroom.myapp.domain.BoardReviewCriteria;
import com.theantiquersroom.myapp.domain.QnADTO;
import com.theantiquersroom.myapp.domain.ReviewDTO;

public interface BoardService {

	 /* 문의게시판 등록 */
	public abstract boolean registerQnA(QnADTO dto);
	
	 /* 문의게시판 목록 */
//	public abstract List<QnADTO>  getQnAList(Integer pId);

	 /* 문의게시판 목록(페이징 적용) */
// public List<QnADTO> getQnAListPaging(BoardQnACriteria cri);

   	 /* 문의게시판 총 갯수 */
  	public Integer getQnATotal();
  	
  	/* 문의게시판 조회 */
  	public QnADTO getQnADetail(Integer bindex);
  	
  	/* 문의게시글 수정 */
  	public Integer modifyQnA(QnADTO dto);

  	/* 문의게시글 삭제 */
  	public Integer removeQnA(Integer bindex);
  	
    /* 게시판 - 답글 등록 */
   	public abstract boolean registerReQnA(QnADTO dto);

   	/* 문의게시판 목록 */
	public List<QnADTO> getQnAListByProductId(BoardQnACriteria cri);  	
	
//  ======== 리뷰게시판 =========
   	
   	/* 리뷰게시판 등록 */
   	public abstract boolean registerReview(ReviewDTO dto);
   	
   	/* 리뷰게시판 목록 */
   	public abstract List<ReviewDTO> getReviewList();
   	
   	/* 리뷰게시판 페이징 */
   	public abstract List<ReviewDTO> getReviewListPaging(BoardReviewCriteria cri);
   	
   	/* 리뷰게시글 총 갯수 */
   	public Integer getReviewTotal();
   	
   	/* 리뷰게시판 조회 */
   	public ReviewDTO getReviewDtail(int reviewId);
   	
   	/* 리뷰게시글 수정 */
   	public Integer modifyReview(ReviewDTO dto);
 
   	/* 리뷰게시글 삭제 */
   	public Integer removeReview(int reviewId);
   	
} // end class

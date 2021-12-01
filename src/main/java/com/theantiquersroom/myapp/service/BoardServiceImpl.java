package com.theantiquersroom.myapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theantiquersroom.myapp.domain.BoardQnACriteria;
import com.theantiquersroom.myapp.domain.BoardReviewCriteria;
import com.theantiquersroom.myapp.domain.QnADTO;
import com.theantiquersroom.myapp.domain.ReviewDTO;
import com.theantiquersroom.myapp.mapper.BoardMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class BoardServiceImpl implements BoardService, InitializingBean, DisposableBean {
	
	@Setter(onMethod_= {@Autowired} )
	private BoardMapper mapper;
	
	/* 문의게시판 목록 */
	@Override
	public List<QnADTO>getQnAListByProductId(BoardQnACriteria cri) {
		log.debug("getQnAList() invoked.");
		
		return this.mapper.getQnAListByProductId(cri);

	} // getQnAList()

	
	/* 문의게시판 등록 */
	@Override
	public boolean registerQnA(QnADTO dto) {
		log.debug("registerQnA({}) invoked.", dto);
		
		int affectedRows=this.mapper.registerQnA(dto);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
	} // registerQnA()
	
	/* 문의게시판 목록(페이징 적용) */
//	@Override
//	public List<QnADTO> getQnAListPaging(BoardQnACriteria cri) {
//		
//		return mapper.getQnAListPaging(cri);
//	}
	
    /* 문의게시물 총 갯수 */
	@Override
	public Integer getQnATotal() {

		return mapper.getQnATotal();
	} // getQnATotal()
	
  	/* 문의게시판 조회 */
	@Override
	public QnADTO getQnADetail(Integer bindex) {

		return mapper.getQnADetail(bindex);
	} // getQnADetail()
	
	/* 문의게시글 수정 */
	@Override
	public Integer modifyQnA(QnADTO dto) {
		
		return mapper.modifyQnA(dto);
	} // modifyQnA()
	
	/* 문의게시글 삭제 */
	@Override
	public Integer removeQnA(Integer bindex) {

		return mapper.removeQnA(bindex);
	} // removeQnA()
	
	/* 문의글 답글 등록 */
	@Override
	public boolean registerReQnA(QnADTO dto) {
		
		int affectedRows=this.mapper.registerReQnA(dto);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
	} // registerReQnA()

	
//	=========================== 리뷰 게시판 ==============================
	
	/* 리뷰게시글 등록 */
	@Override
	public boolean registerReview(ReviewDTO dto) {
		log.info("registerReview() invoked.");
		
		int affectedRows = this.mapper.registerReview(dto);
		log.info("\t+ affectedRows: {}", affectedRows);

		return affectedRows==1;
	}
	
	/* 리뷰게시글 보기 */
	@Override
	public List<ReviewDTO> getReviewList() {
		log.info("getReviewList() invoked.");
		
		return this.mapper.getReviewList();
	}

	@Override
	public List<ReviewDTO> getReviewListPaging(BoardReviewCriteria cri, Integer pid) {
		
		Map<Object,Object> map = new HashMap<>();
		
		map.put("pid",pid);
		
		return mapper.getReviewListPaging(map);
	}

	@Override
	public Integer getReviewTotal() {
		
		return mapper.getQnATotal();
	}

	@Override
	public ReviewDTO getReviewDtail(int reviewId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer modifyReview(ReviewDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer removeReview(int reviewId) {
		// TODO Auto-generated method stub
		return null;
	}
	
//=============================//
	
	@Override
	public void destroy() throws Exception {
		
	} // destroy()

	@Override
	public void afterPropertiesSet() throws Exception {
		
	} // afterPropertiesSet()

} // end class

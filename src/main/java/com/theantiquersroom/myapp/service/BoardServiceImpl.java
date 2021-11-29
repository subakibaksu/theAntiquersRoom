package com.theantiquersroom.myapp.service;

import java.util.List;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theantiquersroom.myapp.domain.BoardQnACriteria;
import com.theantiquersroom.myapp.domain.QnADTO;
import com.theantiquersroom.myapp.mapper.BoardMapper;
import com.theantiquersroom.myapp.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@Service
public class BoardServiceImpl implements BoardService, InitializingBean, DisposableBean {
	
	@Setter(onMethod_= {@Autowired} )
	private BoardMapper mapper;
	
	/* 문의게시판 목록 */
	@Override
	public List<QnADTO>getQnAListByProductId(BoardQnACriteria cri) {
		log.debug("getQnAList() invoked.");
		
		return this.mapper.getQnAListByProductId(cri);

	} 
	
	/* 문의게시판 등록 */
	@Override
	public boolean registerQnA(QnADTO dto) {
		log.debug("registerQnA({}) invoked.", dto);
		
		int affectedRows=this.mapper.registerQnA(dto);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
		
	} 
	
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
	}
	
  	/* 문의게시판 조회 */
	@Override
	public QnADTO getQnADetail(int bindex) {

		return mapper.getQnADetail(bindex);
	}
	
	/* 문의게시글 수정 */
	@Override
	public Integer modifyQnA(QnADTO dto) {
		
		return mapper.modifyQnA(dto);
	}
	
	/* 문의게시글 삭제 */
	@Override
	public Integer removeQnA(int bindex) {

		return mapper.removeQnA(bindex);
	}
	
	/* 문의글 답글 등록 */
	@Override
	public boolean registerReQnA(QnADTO dto) {
		
		int affectedRows=this.mapper.registerReQnA(dto);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
	}
	
//=============================//
	@Override
	public void destroy() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
	}

} // end class

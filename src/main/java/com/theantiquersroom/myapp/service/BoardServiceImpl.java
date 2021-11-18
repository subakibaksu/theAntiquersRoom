package com.theantiquersroom.myapp.service;

import java.util.List;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theantiquersroom.myapp.domain.QnADTO;
import com.theantiquersroom.myapp.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@Service
public class BoardServiceImpl implements BoardService, InitializingBean, DisposableBean {
	
	@Setter(onMethod_= {@Autowired} )
	private BoardMapper mapper;

	@Override
	public boolean registerQnA(QnADTO dto) {
		log.debug("registerQnA({}) invoked.", dto);
		
		int affectedRows=this.mapper.registerQnA(dto);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;
		
	}
	
	@Override
	public List<QnADTO> getList() {
		log.debug("getList() invoked.");
		
		return this.mapper.getList();

		
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





}

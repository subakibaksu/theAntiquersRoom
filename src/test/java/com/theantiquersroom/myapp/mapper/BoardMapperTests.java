package com.theantiquersroom.myapp.mapper;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.theantiquersroom.myapp.domain.BoardQnACriteria;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {

	@Setter(onMethod_= {@Autowired})
	private BoardMapper mapper;
	
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assert this.mapper != null;
		log.info("\t+ mapper: {}", mapper);
		log.info("\t+ type: {}", this.mapper.getClass().getName());
		
	} //setup
	
    /* 문의게시판 목록(페이징 적용)테스트 */
	 @Test
	 public void testGetQnAListPaging() {
	     
		 BoardQnACriteria cri = new BoardQnACriteria();
		 
		 cri.setPageNum(3);
	                      
	     List list = mapper.getQnAListPaging(cri);
	     
	     list.forEach(board -> log.info("" + board));
	 }


	
} //end class

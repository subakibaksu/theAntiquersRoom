package com.theantiquersroom.myapp.mapper;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.theantiquersroom.myapp.domain.BoardQnACriteria;
import com.theantiquersroom.myapp.domain.QnADTO;

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

	 /* 문의게시판 조회 */
	 @Test
	 public void testGetQnADetail() {
		 
		 int bindex = 50;
	     
		 log.info("" + mapper.getQnADetail(bindex));

	 }
	 
	 /* 문의게시글 수정 */
	 @Test
	 public void testModifyQnA() {
		 
         QnADTO dto = new QnADTO();
         dto.setBindex(48);
         dto.setTitle("수정 제목3");
         dto.setContent("수정 내용3");
         
         int result = mapper.modifyQnA(dto);
         log.info("result : " +result);

	 }
	 
	 /* 문의게시글 삭제 */
    @Test
    public void testRemoveQnA() {
        
        int result = mapper.removeQnA(50);
        log.info("result : " + result);
        
    }
    
    @Test
    public void testRegisterQnA() {
        
    	QnADTO dto = new QnADTO();
    	
    	dto.setTitle("mapper test");
    	dto.setContent("mapper test");
    	dto.setAuthor("Kingdindoo");
    	dto.setPId(2);
    	
    	mapper.registerQnA(dto);
        
    }
    
    public void testRegisterReQnA() {
        
    	QnADTO dto = new QnADTO();
    	
    	dto.setTitle("mapper test");
    	dto.setContent("mapper test");
    	dto.setAuthor("Kingdindoo");
    	dto.setPId(2);
    	
    	mapper.registerReQnA(dto);
        
    }

    
} //end class

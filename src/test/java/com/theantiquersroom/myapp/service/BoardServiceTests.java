package com.theantiquersroom.myapp.service;

import static org.junit.Assert.assertNotNull;

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
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class BoardServiceTests {

	@Setter(onMethod_= {@Autowired})
	private BoardService service;
	
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assertNotNull(this.service);
		log.info("\t+ service: {}", service);
	} //setup
	
	
    /* 게시판 조회(페이징 적용) */
    @Test
    public void testGetQnAListPaging() {
        
    	BoardQnACriteria cri = new BoardQnACriteria();
        
        List list = service.getQnAListPaging(cri);
        
        list.forEach(board -> log.info("" + board));
        
        
    }
    
    /* 문의게시판 조회 */
    @Test
    public void testGetQnADetail() {
        
    	int bindex = 50;

        log.info("" + service.getQnADetail(bindex));
        
    }
    
	 /* 문의게시글 수정 */
	 @Test
	 public void testModifyQnA() {
		 
        QnADTO dto = new QnADTO();
        dto.setBindex(50);
        dto.setTitle("수정 제목3");
        dto.setContent("수정 내용3");
        
        int result = service.modifyQnA(dto);
        log.info("result : " +result);

	 }

	
} //end class

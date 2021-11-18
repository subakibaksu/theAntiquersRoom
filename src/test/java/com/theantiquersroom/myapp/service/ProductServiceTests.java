package com.theantiquersroom.myapp.service;

import static org.junit.Assert.assertNotNull;

import java.util.Objects;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.theantiquersroom.myapp.domain.ProductDTO;

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
public class ProductServiceTests {

	@Setter(onMethod_= {@Autowired})
	private ProductService service;
	
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assertNotNull(this.service);
		log.info("\t+ service: {}", service);
	} //setup
	
	@Test
	public void testGetDetail() {
		log.debug("testGetDetail() invoked.");

		Integer pId = 30;

		ProductDTO dto = this.service.getDetail(pId);
		
		Objects.requireNonNull(dto);
		log.info("\t+ dto: {}", dto);
		
	} //testGetDetail
	
	@Test
	public void testRemove() {
		log.debug("testRemove() invoked.");
		
		Integer pId = 11;
		boolean isRemoved = this.service.removeProduct(pId);
		
		log.info("\t+ isRemoved: {}", isRemoved);
	} //testRemove
	
} //end class

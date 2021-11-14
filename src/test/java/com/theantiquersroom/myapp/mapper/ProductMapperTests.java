package com.theantiquersroom.myapp.mapper;

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
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductMapperTests {

	@Setter(onMethod_= {@Autowired})
	private ProductMapper mapper;
	
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assert this.mapper != null;
		log.info("\t+ mapper: {}", mapper);
		log.info("\t+ type: {}", this.mapper.getClass().getName());
		
	} //setup
	
	@Test
	public void testGetDetailByPId() {
		log.debug("testGetDetailByPId() invoked.");
		
		Integer pId = 5;
		ProductDTO dto = this.mapper.getDetailByPId(pId);
		
		log.info("\t+ dto: {}", dto);
	} //testGetDetailByPId
	
} //end class

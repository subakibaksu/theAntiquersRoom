package com.theantiquersroom.myapp.mapper;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.theantiquersroom.myapp.domain.UserVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {

	
	@Setter(onMethod_= {@Autowired})
	AdminMapper mapper;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assert this.mapper != null;
		log.info("\t+ mapper: {}", mapper);
	} //setup
	
	@Test
	public void testSelectUserByNick() {
		log.debug("testSelectUserByNick() invoked.");
		
		List<UserVO> user=this.mapper.selectUserByNick("a");
		user.forEach(log::info);
	} //testSelectUserByNick
	
} //end class

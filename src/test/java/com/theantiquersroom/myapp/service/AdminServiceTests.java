package com.theantiquersroom.myapp.service;

import java.util.List;
import java.util.Objects;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.theantiquersroom.myapp.domain.MypageCriteria;
import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.mapper.AdminMapper;

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
public class AdminServiceTests {

	@Setter(onMethod_= {@Autowired})
	AdminMapper mapper;
	
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assert this.mapper != null;
		log.info("\t+ mapper: {}", mapper);
		
	} //setup
	
	@Test
	public void testGetUserList() {
		log.debug("testGetUserList() invoked.");
		
		MypageCriteria cri = new MypageCriteria();
		cri.setAmount(10);
		
		List<UserDTO> users=this.mapper.selectUserList(cri);
		
		Objects.requireNonNull(users);
		log.info("\t+ users: {}", users);
		
	} //testGetUserList
	
	
} //end class

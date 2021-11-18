package com.theantiquersroom.myapp.service;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.theantiquersroom.myapp.domain.MypageCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class UserServiceTests implements InitializingBean, DisposableBean{
	
	@Setter(onMethod_= {@Autowired})
	private UserService service;
	
	@Before
	public void setUp() {
		
		log.debug("setUp() invoked");
		
		assertNotNull(this.service);
		log.info("\t + service : {}", service);
		
	}//setUp()
	
	@Test(timeout=1000)
	public void testGetMyAuctionList() {
		
		log.debug("testGetMyAuctionList() invoked");
		
		String userId = "asdfasdf@gmail.com";
		MypageCriteria mcri = new MypageCriteria();
		
		HashMap<String, Object> map  = new HashMap<>();
		map.put("userId", userId);
		map.put("cri", mcri);
		
		List<ProductDTO> list = this.service.getMyAuctionList(map);
		log.info("\t + list : {}", list.size());
		
	}//testGetMyAuctionList
	
	
	@Override
	public void destroy() throws Exception {
		// TODO Auto-generated method stub
		
	}//destroy

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
	}//afterPropertiesSet
	
}//end class

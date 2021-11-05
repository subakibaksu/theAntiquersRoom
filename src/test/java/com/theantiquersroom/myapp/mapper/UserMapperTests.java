package com.theantiquersroom.myapp.mapper;


import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;


@Log4j2
@NoArgsConstructor

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class UserMapperTests {

    @Setter(onMethod_= {@Autowired})
    private UserMapper mapper;

    @Before
    public void setUp() { //사전처리 : 주입받은 객체가 null인지 체크
        log.debug("setUp() invoked");

        assert this.mapper != null;
        log.info("\t + mapper : {}", this.mapper);
        log.info("\t + type : {}", this.mapper.getClass().getName());
    }//setup

    @Test
    public void testGetUserList() {
        log.debug("testGetUserList() invoked");

    }//testGetUserList

    @After
    public void tearDown() {
        log.debug("tearDown() invoked");
    }//tearDown

}//end class

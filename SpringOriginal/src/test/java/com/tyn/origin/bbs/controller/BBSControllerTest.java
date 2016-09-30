package com.tyn.origin.bbs.controller;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tyn.origin.bbs.dao.BBSDao;
import com.tyn.origin.bbs.service.BBSService;
import com.tyn.origin.bbs.vo.BBSVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
							        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
							        "file:src/main/webapp/WEB-INF/spring/root-context.xml"
							      })
public class BBSControllerTest {
	@Autowired
	private ApplicationContext applicationContext;
 
	@Autowired
	private BBSService bbsService;
	@Autowired
	private BBSDao bbsDao;
	
	@Test
    public void test(){
		assertThat(bbsDao.getBBSContent(2).getTitle(), is("1"));
    }
}

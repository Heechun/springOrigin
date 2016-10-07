package com.tyn.origin.main.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.context.ApplicationContext;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter;

import com.tyn.origin.main.service.MainService;

@RunWith(MockitoJUnitRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class MainControllerTest {

    @Inject
    private ApplicationContext applicationContext;

    private MockHttpServletRequest request;
    private MockHttpServletResponse response;
    private AnnotationMethodHandlerAdapter adapter;
    private MainController controller;

    @Mock
    private MainService mainService;

    @Mock
    private ModelAndView bbsVO;

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
    }

    @AfterClass
    public static void tearDownAfterClass() throws Exception {
    }

    @Before
    public void setUp() throws Exception {
        this.request = new MockHttpServletRequest();
        this.response = new MockHttpServletResponse();
        this.adapter = new AnnotationMethodHandlerAdapter();
        this.controller = new MainController();
//        this.controller.setMainService(mainService);
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void testBoardContentView () throws Exception {
        request.setMethod("GET");
        request.setRequestURI("/boardContentView");

//        bbsVO.setContent("content");
//        bbsVO.setTitle("title");

//        Mockito.when(mainService.getBBSList()).thenReturn(bbsVO);
//        Model model = new ExtendedModelMap();

//        String view = controller.boardContentView(model);

//        assertEquals("boardContentView", view);
    }

}

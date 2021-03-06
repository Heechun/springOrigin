package com.tyn.origin.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tyn.origin.main.service.LoginService;
import com.tyn.origin.main.service.MainService;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	
	@Autowired
	LoginService logInService;
	
	private String state;
	private String code;
	private String access_token;
	private String refresh_token;
	private String token_type;
	private final String naverClientId = "vD44jP35GPRhQOPUhnaG";
	private final String naverClientSecret = "Rk7NhmmsVz";
	private String returnUrl;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
		
	@RequestMapping("/main.do")
	public ModelAndView main(Model model){
		logger.info("main.do 접속");		
		return mainService.getMain();
	}
	
	@RequestMapping("/intro.do")
	public ModelAndView intro(){
		logger.info("intro.do 접속");
		
		return mainService.intro();
	}
	@RequestMapping("/location.do")
	public String location(){
		logger.info("location.do 접속");
		
		return "/main/location";
	}
	/*
	 * BindingReuslt or Error
	 * 회원가입시 검증을 위해 사용
	 * String -> User로 바꿔야함
	 * 반드시 modelAttribute뒤에 써야 그 요소에 대한 검증가능
	 *  
	 */
	@RequestMapping("/memberAdd.do")
	public String memberAdd(@ModelAttribute String user, BindingResult bindingResult){
		return "main/memberAdd";
	}
	
	/*
	 * 관리자 관련기능
	 * 1. manager Login Check
	 * 2. manager Main Page , login
	 * 3. manager Logout
	 * 
	 */

	@RequestMapping("/loginCheck.do")
	public void loginCheck(@RequestParam("inputId") String inputId, @RequestParam("inputPassword") String inputPassword, HttpServletResponse res){
		logger.info("loginCheck.do 접속(json)");
		mainService.loginCheck(inputId, inputPassword, res);
	}
	@RequestMapping("/managerMain.do")
	public String managerMain(HttpSession session){
		logger.info("managerMain 접속");
		session.setAttribute("admin", "manager");
		return "main/main";
	}
	@RequestMapping("/admin/managerLogout.do")
	public String managerLogout(HttpSession session){
		logger.info("managerLogout 접속");
		session.invalidate();
		return "redirect:/main.do";
	}

	/*
	 * 네이버 로그인 API
	 * 
	 */
	@RequestMapping(value = "/naverLogin.do")
	public String makeNaverRequestStatement(HttpServletRequest request) {
		logger.info("naverLogin.do 접속");
		HashMap<String, String> naverUrl = logInService.makeNaverRequestStatement(naverClientId);
		this.state = naverUrl.get("state");
		
		returnUrl=request.getHeader("referer"); 
		return "redirect:" + naverUrl.get("url");
	}

	@RequestMapping(value = "/naverRequestKey.do")
	public String getNaverRequestKey(@RequestParam("state") String state, @RequestParam("code") String code, HttpSession session) {
		logger.info("naverRequestKey.do 접속");
		if (state.equals(this.state)) {
			session.setAttribute("isLoged", true);
		} 
		else {
			session.setAttribute("isLoged", false);
			System.out.println("state key값 불일치. 인증에러");
			return "redirect:/main.do";
		}
		this.code = code;
		HashMap<String, String> result = logInService.getNaverRequestKey(state,
				code, naverClientId, naverClientSecret);

		access_token = result.get("access_token");
		refresh_token = result.get("refresh_token");
		token_type = result.get("token_type");

		return "redirect:/naverRequestUserInfo.do";
	}

	@RequestMapping(value="/naverRequestUserInfo.do")
	public String naverRequestUserInfo(HttpSession session){
		logger.info("naverRequestUserInfo.do 접속");
		HashMap<String,String> result = logInService.naverRequestUserInfo(token_type,access_token);
		
		session.setAttribute("email",result.get("email"));
		session.setAttribute("nickname",result.get("nickname"));
		session.setAttribute("gender",result.get("gender"));

		return "redirect:"+returnUrl;
	}

	@RequestMapping(value="/naverLogout.do")
	public String naverLogout(HttpSession session){
		logger.info("naverLogout.do 접속");
		session.removeAttribute("email");
		session.removeAttribute("nickname");
		session.removeAttribute("gender");
		
		return "main/main";
	}
	
}

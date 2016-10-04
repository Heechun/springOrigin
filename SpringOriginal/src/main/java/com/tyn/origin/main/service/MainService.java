package com.tyn.origin.main.service;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface MainService {

	ModelAndView getMain();
	
	ModelAndView intro();

	void loginCheck(String inputId, String inputPassword, HttpServletResponse res);

	
}

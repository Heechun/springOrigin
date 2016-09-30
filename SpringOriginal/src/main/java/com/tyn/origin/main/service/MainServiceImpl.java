package com.tyn.origin.main.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.tyn.origin.main.dao.MainDao;


@Service("mainService")
public class MainServiceImpl implements MainService {
	@Inject
	private MainDao mainDao;
	ModelAndView mav;
	
	@Override
	public ModelAndView getMain() {
		mav = new ModelAndView();
		
		mav.setViewName("main");
		return mav;
	}
	
	@Override
	public ModelAndView intro() {
		mav = new ModelAndView();
		
		mav.setViewName("intro");
		return mav;
	}

	
	
}

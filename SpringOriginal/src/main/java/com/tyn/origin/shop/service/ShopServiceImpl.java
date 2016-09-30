package com.tyn.origin.shop.service;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class ShopServiceImpl implements ShopService {

	@Override
	public ModelAndView shopContent() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shopContent");
		
		return mav;
	}
	
}

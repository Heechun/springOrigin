package com.tyn.origin.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tyn.origin.bbs.controller.BBSController;
import com.tyn.origin.shop.service.ShopService;

@Controller
public class ShopController {
	@Autowired
	private ShopService shopService;
	
	private static final Logger logger = LoggerFactory.getLogger(BBSController.class);
	
	@RequestMapping("/shopMain.do")
	public String shopMain(){
		logger.info("shopMain.do 접속");
		
		return "shopMain";
	}
	@RequestMapping("/shopContent.do")
	public ModelAndView shopContent(){
		logger.info("shopContent.do 접속");
		
		return shopService.shopContent();
	}
	
}
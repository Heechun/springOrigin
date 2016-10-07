package com.tyn.origin.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tyn.origin.bbs.controller.BBSController;
import com.tyn.origin.shop.service.ShopService;
import com.tyn.origin.shop.vo.OrderVO;
import com.tyn.origin.shop.vo.ShopItemVO;

@Controller
public class ShopController {
	@Autowired
	private ShopService shopService;
	
	private static final Logger logger = LoggerFactory.getLogger(BBSController.class);
	
	@RequestMapping("/shopMain.do")
	public ModelAndView shopMain(){
		logger.info("shopMain.do 접속");
		
		return shopService.shopMain();
	}
	@RequestMapping("/shopContent.do")
	public ModelAndView shopContent(String itemNum){
		logger.info("shopContent.do 접속");
		
		return shopService.shopContent(itemNum);
	}
	@RequestMapping("/shopOrder.do")
	public String shopOrder(OrderVO orderVO, Model model){
		logger.info("shopOrder.do 접속");
		
		orderVO.setOrderTotalPrice(orderVO.getOrderItemPrice()*orderVO.getOrderItemCount()+orderVO.getOrderShipping());
		
		model.addAttribute("orderVO", orderVO);
		return "shop/shopOrder";
	}
	/*
	 * 상품 추가 관련 기능
	 * 
	 */
	@RequestMapping("/admin/addItem.do")
	public String addItem(){
		logger.info("/admin/addItem.do 접속");
		return "shop/addItem";
	}
	@RequestMapping("/admin/addItemImpl.do")
	public String addItemImpl(ShopItemVO shopItemVO, MultipartHttpServletRequest mReq){
		logger.info("/admin/addItemImpl.do 접속");
		
		return shopService.addItemImpl(shopItemVO, mReq);
	}
	/*
	 * 장바구니 기능
	 * 
	 */
	@RequestMapping("cartPut.do")
	public void cartPut(String cartItemNum){
		logger.info("cartPut.do ($.get) 접속");
		shopService.cartPut(cartItemNum);
	}
	@RequestMapping("cartList.do")
	public ModelAndView cartList(){
		logger.info("cartList.do");
		return shopService.cartList();
	}
	@RequestMapping("cartDelete.do")
	public String cartDelete(String cartNum){
		logger.info("cartDelete.do");
		shopService.cartDelete(cartNum);
		
		return "redirect:/cartList.do";
	}
}

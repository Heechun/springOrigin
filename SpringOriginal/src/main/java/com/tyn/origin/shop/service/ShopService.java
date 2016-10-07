package com.tyn.origin.shop.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tyn.origin.shop.vo.ShopItemVO;

public interface ShopService {

	ModelAndView shopContent(String itemNum);

	String addItemImpl(ShopItemVO shopItemVO, MultipartHttpServletRequest mReq);

	ModelAndView shopMain();

	void cartPut(String cartItemNum);

	ModelAndView cartList();

	void cartDelete(String cartNum);

}

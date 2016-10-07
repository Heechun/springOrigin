package com.tyn.origin.shop.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tyn.origin.shop.dao.ShopDao;
import com.tyn.origin.shop.vo.ShopItemVO;

@Service
public class ShopServiceImpl implements ShopService {
	@Inject
	private ShopDao shopDao;
	
	@Override
	public ModelAndView shopContent(String itemNum) {
		ModelAndView mav = new ModelAndView();
		ShopItemVO shopItemVO = shopDao.getItem(itemNum);
		
		mav.addObject("shopItemVO", shopItemVO);
		mav.setViewName("shop/shopContent");
		
		return mav;
	}

	@Override
	public String addItemImpl(ShopItemVO shopItemVO, MultipartHttpServletRequest mReq) {
		
		SimpleDateFormat sdfNow = new SimpleDateFormat("yyyyMMddHHmmss");
		String itemNum = sdfNow.format(new Date(System.currentTimeMillis()));
		shopItemVO.setItemNum(itemNum);
		
		shopDao.insertShopItem(shopItemVO);
//		List<MultipartFile> mfile = mReq.getFiles("itemImages");
//		commonsFileUploads.commonsFileUpload(mfile, shopItemVO.getItemNum());
		
		return "redirect:/shopMain.do";
	}

	@Override
	public ModelAndView shopMain() {
		ModelAndView mav = new ModelAndView();
		
		List<ShopItemVO> itemList = shopDao.getItemList();
		
		mav.addObject("itemList", itemList);
		mav.setViewName("shop/shopMain");
		return mav;
	}
	
}

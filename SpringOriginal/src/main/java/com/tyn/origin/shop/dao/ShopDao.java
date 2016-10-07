package com.tyn.origin.shop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tyn.origin.main.vo.FileVO;
import com.tyn.origin.shop.vo.CartItemVO;
import com.tyn.origin.shop.vo.ShopItemVO;

@Repository
public interface ShopDao {

	void insertShopItem(ShopItemVO shopItemVO);

	void insertFile(FileVO fileDto);

	List<ShopItemVO> getItemList();

	ShopItemVO getItem(String itemNum);

	void insertCart(String cartItemNum);

	List<CartItemVO> getCartList();

	void deleteCart(String cartNum);

}

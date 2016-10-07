package com.tyn.origin.shop.vo;

public class CartItemVO {
	private int cartNum;
	private String cartItemNum;
	private int cartItemCount;
	private int cartItemPrice;
	private String cartItemName;
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getCartItemNum() {
		return cartItemNum;
	}
	public void setCartItemNum(String cartItemNum) {
		this.cartItemNum = cartItemNum;
	}
	public int getCartItemCount() {
		return cartItemCount;
	}
	public void setCartItemCount(int cartItemCount) {
		this.cartItemCount = cartItemCount;
	}
	public int getCartItemPrice() {
		return cartItemPrice;
	}
	public void setCartItemPrice(int cartItemPrice) {
		this.cartItemPrice = cartItemPrice;
	}
	public String getCartItemName() {
		return cartItemName;
	}
	public void setCartItemName(String cartItemName) {
		this.cartItemName = cartItemName;
	}
	@Override
	public String toString() {
		return "CartItemVO [cartNum=" + cartNum + ", cartItemNum="
				+ cartItemNum + ", cartItemCount=" + cartItemCount
				+ ", cartItemPrice=" + cartItemPrice + ", cartItemName="
				+ cartItemName + "]";
	}
	
}

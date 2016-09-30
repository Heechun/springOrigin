package com.tyn.origin.shop.vo;

public class OrderVo {
	private int orderNumber;
	private String orderProduct;
	private String orderShipping;
	private int orderCount;
	private int orderPrice;
	private String orderClientName;
	private String orderClientAddress;
	private String orderClientMemo;
	
	
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getOrderProduct() {
		return orderProduct;
	}
	public void setOrderProduct(String orderProduct) {
		this.orderProduct = orderProduct;
	}
	public String getOrderShipping() {
		return orderShipping;
	}
	public void setOrderShipping(String orderShipping) {
		this.orderShipping = orderShipping;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getOrderClientName() {
		return orderClientName;
	}
	public void setOrderClientName(String orderClientName) {
		this.orderClientName = orderClientName;
	}
	public String getOrderClientAddress() {
		return orderClientAddress;
	}
	public void setOrderClientAddress(String orderClientAddress) {
		this.orderClientAddress = orderClientAddress;
	}
	public String getOrderClientMemo() {
		return orderClientMemo;
	}
	public void setOrderClientMemo(String orderClientMemo) {
		this.orderClientMemo = orderClientMemo;
	}
	
	@Override
	public String toString() {
		return "OrderVo [orderNumber=" + orderNumber + ", orderProduct=" + orderProduct + ", orderShipping="
				+ orderShipping + ", orderCount=" + orderCount + ", orderPrice=" + orderPrice + ", orderClientName="
				+ orderClientName + ", orderClientAddress=" + orderClientAddress + ", orderClientMemo="
				+ orderClientMemo + "]";
	}	
}

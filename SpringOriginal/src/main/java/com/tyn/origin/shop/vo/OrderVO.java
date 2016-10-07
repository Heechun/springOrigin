package com.tyn.origin.shop.vo;

public class OrderVO {
	private int orderNumber;
	private String orderItemName;
	private String orderItemNum;
	private int orderItemCount;
	private int orderItemPrice;
	private int orderShipping;
	private int orderTotalPrice;
	private String orderClientName;
	private String orderClientAddress;
	private String orderClientMemo;
	private String orderClientPhone;
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getOrderItemName() {
		return orderItemName;
	}
	public void setOrderItemName(String orderItemName) {
		this.orderItemName = orderItemName;
	}
	public String getOrderItemNum() {
		return orderItemNum;
	}
	public void setOrderItemNum(String orderItemNum) {
		this.orderItemNum = orderItemNum;
	}
	public int getOrderItemCount() {
		return orderItemCount;
	}
	public void setOrderItemCount(int orderItemCount) {
		this.orderItemCount = orderItemCount;
	}
	public int getOrderItemPrice() {
		return orderItemPrice;
	}
	public void setOrderItemPrice(int orderItemPrice) {
		this.orderItemPrice = orderItemPrice;
	}
	public int getOrderShipping() {
		return orderShipping;
	}
	public void setOrderShipping(int orderShipping) {
		this.orderShipping = orderShipping;
	}
	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}
	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
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
	public String getOrderClientPhone() {
		return orderClientPhone;
	}
	public void setOrderClientPhone(String orderClientPhone) {
		this.orderClientPhone = orderClientPhone;
	}
	@Override
	public String toString() {
		return "OrderVO [orderNumber=" + orderNumber + ", orderItemName=" + orderItemName + ", orderItemNum="
				+ orderItemNum + ", orderItemCount=" + orderItemCount + ", orderItemPrice=" + orderItemPrice
				+ ", orderShipping=" + orderShipping + ", orderTotalPrice=" + orderTotalPrice + ", orderClientName="
				+ orderClientName + ", orderClientAddress=" + orderClientAddress + ", orderClientMemo="
				+ orderClientMemo + ", orderClientPhone=" + orderClientPhone + "]";
	}
	
	
	
}
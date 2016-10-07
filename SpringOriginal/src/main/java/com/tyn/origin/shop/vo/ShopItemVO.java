package com.tyn.origin.shop.vo;

public class ShopItemVO {
	private int itemIdx;
	private String itemNum;
	private String itemName;
	private int itemPrice;
	private int itemCount;
	private String itemContent;
	private int itemHit;
	private String itemDate;
	private int itemSellCount;
	public int getItemIdx() {
		return itemIdx;
	}
	public void setItemIdx(int itemIdx) {
		this.itemIdx = itemIdx;
	}
	public String getItemNum() {
		return itemNum;
	}
	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	public String getItemContent() {
		return itemContent;
	}
	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}
	public int getItemHit() {
		return itemHit;
	}
	public void setItemHit(int itemHit) {
		this.itemHit = itemHit;
	}
	public String getItemDate() {
		return itemDate;
	}
	public void setItemDate(String itemDate) {
		this.itemDate = itemDate;
	}
	public int getItemSellCount() {
		return itemSellCount;
	}
	public void setItemSellCount(int itemSellCount) {
		this.itemSellCount = itemSellCount;
	}
	@Override
	public String toString() {
		return "ShopItemVO [itemIdx=" + itemIdx + ", itemNum=" + itemNum + ", itemName=" + itemName + ", itemPrice="
				+ itemPrice + ", itemCount=" + itemCount + ", itemContent=" + itemContent + ", itemHit=" + itemHit
				+ ", itemDate=" + itemDate + ", itemSellCount=" + itemSellCount + "]";
	}
	
	
	
}

package com.tyn.origin.main.vo;

public class FileVO {
	private int fileNum;
	private String originFname;
	private String storedFname;
	private long fileLength;
	private String itemNum;
	
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public String getOriginFname() {
		return originFname;
	}
	public void setOriginFname(String originFname) {
		this.originFname = originFname;
	}
	public String getStoredFname() {
		return storedFname;
	}
	public void setStoredFname(String storedFname) {
		this.storedFname = storedFname;
	}
	public long getFileLength() {
		return fileLength;
	}
	public void setFileLength(long fileLength) {
		this.fileLength = fileLength;
	}
	public String getItemNum() {
		return itemNum;
	}
	public void setItemNum(String itemNum) {
		this.itemNum = itemNum;
	}
	@Override
	public String toString() {
		return "FileVO [fileNum=" + fileNum + ", originFname=" + originFname + ", storedFname=" + storedFname
				+ ", fileLength=" + fileLength + ", itemNum=" + itemNum + "]";
	}
	
	
	
}

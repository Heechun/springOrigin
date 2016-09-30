package com.tyn.origin.bbs.vo;



public class BBSVO {
	private int idx;
	private String id;
	private String title;
	private String content;
	private int hit;
	private String writeDate;
	private String password;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "BBSVO [idx=" + idx + ", id=" + id + ", title=" + title + ", content=" + content + ", hit=" + hit
				+ ", writeDate=" + writeDate + ", password=" + password + "]";
	}
	
	
	
}

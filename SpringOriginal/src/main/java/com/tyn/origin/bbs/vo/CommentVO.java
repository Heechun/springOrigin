package com.tyn.origin.bbs.vo;

public class CommentVO {
	private int bbsIdx;
	private int commentIdx;
	private String commentId;
	private String commentPassword;
	private String commentContent;
	private String commentDate;
	private int good;
	private int bad;
	public int getBbsIdx() {
		return bbsIdx;
	}
	public void setBbsIdx(int bbsIdx) {
		this.bbsIdx = bbsIdx;
	}
	public int getCommentIdx() {
		return commentIdx;
	}
	public void setCommentIdx(int commentIdx) {
		this.commentIdx = commentIdx;
	}
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public String getCommentPassword() {
		return commentPassword;
	}
	public void setCommentPassword(String commentPassword) {
		this.commentPassword = commentPassword;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	@Override
	public String toString() {
		return "CommentVO [bbsIdx=" + bbsIdx + ", commentIdx=" + commentIdx + ", commentId=" + commentId
				+ ", commentPassword=" + commentPassword + ", commentContent=" + commentContent + ", commentDate="
				+ commentDate + ", good=" + good + ", bad=" + bad + "]";
	}
	
	
	
	
}

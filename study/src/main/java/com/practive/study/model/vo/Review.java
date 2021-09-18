package com.practive.study.model.vo;

import java.sql.Date;

public class Review {

	private int reviewNo;
	private String title;
	private String content;
	private String writer;
	private Date createDate;
	private int viewCnt;
	
	public Review() {}
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}


	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", createDate=" + createDate + ", viewCnt=" + viewCnt + "]";
	}
	
}

package com.practive.study.model.vo;

import java.util.Date;

public class Snack {

	private int snackNo;
	private int categoryNo;
	private String snackName;
	private String snackDetail;
	private String snackImg;
	private int price;
	private int count;
	private int sales;
	private Date snackDate;
	
	public Snack() {}

	public int getSnackNo() {
		return snackNo;
	}

	public void setSnackNo(int snackNo) {
		this.snackNo = snackNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getSnackName() {
		return snackName;
	}

	public void setSnackName(String snackName) {
		this.snackName = snackName;
	}

	public String getSnackDetail() {
		return snackDetail;
	}

	public void setSnackDetail(String snackDetail) {
		this.snackDetail = snackDetail;
	}

	public String getSnackImg() {
		return snackImg;
	}

	public void setSnackImg(String snackImg) {
		this.snackImg = snackImg;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public Date getSnackDate() {
		return snackDate;
	}

	public void setSnackDate(Date snackDate) {
		this.snackDate = snackDate;
	}

	@Override
	public String toString() {
		return "Snack [snackNo=" + snackNo + ", categoryNo=" + categoryNo + ", snackName=" + snackName
				+ ", snackDetail=" + snackDetail + ", snackImg=" + snackImg + ", price=" + price + ", count=" + count
				+ ", sales=" + sales + ", snackDate=" + snackDate + "]";
	}
	
	
}

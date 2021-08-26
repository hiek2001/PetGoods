package com.practive.study.model.vo;

import java.sql.Date;

public class Order {

	private int orderNo;
	private String orderEmail;
	private String orderName;
	private String orderPhone;
	private String orderAddr1;
	private String orderAddr2;
	private String orderAddr3;
	private int allPrice;
	private String orderNote;
	private Date oDate;
	private String orderUid;
	
	public Order () {}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderEmail() {
		return orderEmail;
	}

	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderAddr1() {
		return orderAddr1;
	}

	public void setOrderAddr1(String orderAddr1) {
		this.orderAddr1 = orderAddr1;
	}

	public String getOrderAddr2() {
		return orderAddr2;
	}

	public void setOrderAddr2(String orderAddr2) {
		this.orderAddr2 = orderAddr2;
	}

	public String getOrderAddr3() {
		return orderAddr3;
	}

	public void setOrderAddr3(String orderAddr3) {
		this.orderAddr3 = orderAddr3;
	}

	public int getAllPrice() {
		return allPrice;
	}

	public void setAllPrice(int allPrice) {
		this.allPrice = allPrice;
	}

	public String getOrderNote() {
		return orderNote;
	}

	public void setOrderNote(String orderNote) {
		this.orderNote = orderNote;
	}

	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public String getOrderUid() {
		return orderUid;
	}

	public void setOrderUid(String orderUid) {
		this.orderUid = orderUid;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", orderEmail=" + orderEmail + ", orderName=" + orderName + ", orderPhone="
				+ orderPhone + ", orderAddr1=" + orderAddr1 + ", orderAddr2=" + orderAddr2 + ", orderAddr3="
				+ orderAddr3 + ", allPrice=" + allPrice + ", orderNote=" + orderNote + ", oDate=" + oDate
				+ ", orderUid=" + orderUid + "]";
	}
	
}

package com.entity;

import java.sql.Timestamp;

public class Service {
private int sId;
private String sName;
private double sPrice;
private int uId;
private String sState;
private String sIntroduce;
private int pId;
private Timestamp sTime;
public String sImage;

public Service(){}

public int getsId() {
	return sId;
}
public void setsId(int sId) {
	this.sId = sId;
}
public String getsName() {
	return sName;
}
public void setsName(String sName) {
	this.sName = sName;
}
public double getsPrice() {
	return sPrice;
}
public void setsPrice(double sPrice) {
	this.sPrice = sPrice;
}
public int getuId() {
	return uId;
}
public void setuId(int uId) {
	this.uId = uId;
}
public String getsState() {
	return sState;
}
public void setsState(String sState) {
	this.sState = sState;
}
public String getsIntroduce() {
	return sIntroduce;
}
public void setsIntroduce(String sIntroduce) {
	this.sIntroduce = sIntroduce;
}
public int getpId() {
	return pId;
}
public void setpId(int pId) {
	this.pId = pId;
}
public Timestamp getsTime() {
	return sTime;
}
public void setsTime(Timestamp sTime) {
	this.sTime = sTime;
}
public String getsImage() {
	return sImage;
}
public void setsImage(String sImage) {
	this.sImage = sImage;
}
}

package com.entity;

import java.sql.Timestamp;

public class Order {
	private int oId;
	private String oEvaluate;
	private int isPet;
	private int Id;
	private int uId;
	private String oState;
	private Timestamp oTime;
	public Order() {
    }
	public Order(String oEvaluate,int isPet,int Id,int uId,String oState,Timestamp oTime){
		this.oEvaluate=oEvaluate;
		this.isPet=isPet;
		this.Id=Id;
		this.uId=uId;
		this.oState=oState;
		this.oTime=oTime;
	}
	public int getoId() {
		return oId;
	}
	public void setoId(int oId) {
		this.oId = oId;
	}
	public String getoEvaluate() {
		return oEvaluate;
	}
	public void setoEvaluate(String oEvaluate) {
		this.oEvaluate = oEvaluate;
	}
	public int getisPet() {
		return isPet;
	}
	public void setisPet(int isPet) {
		this.isPet = isPet;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		this.Id = id;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getoState() {
		return oState;
	}
	public void setoState(String oState) {
		this.oState = oState;
	}
	public Timestamp getoTime() {
		return oTime;
	}
	public void setoTime(Timestamp oTime) {
		this.oTime = oTime;
	}
}

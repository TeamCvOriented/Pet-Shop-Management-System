package com.entity;

public class User {
  private int uId;
  private String uName;
  private String uPassword;
  private int isManager;
  private String uEmail;
  private String uPhone;
  private double uWallet;
  public double getuWallet(){
	  return this.uWallet;
  }
  public void setuWallet(double uWallet){
	  this.uWallet = uWallet;
  }
public int getuId() {
	return uId;
}
public void setuID(int uId) {
	this.uId = uId;
}
public String getuName() {
	return uName;
}
public void setuName(String uName) {
	this.uName = uName;
}
public String getuPassword() {
	return uPassword;
}
public void setuPassword(String uPassword) {
	this.uPassword = uPassword;
}
public int getIsManager() {
	return isManager;
}
public void setIsManager(int isManager) {
	this.isManager = isManager;
}
public String getuEmail() {
	return uEmail;
}
public void setuEmail(String uEmail) {
	this.uEmail = uEmail;
}
public String getuPhone() {
	return uPhone;
}
public void setuPhone(String uPhone) {
	this.uPhone = uPhone;
}
  
}

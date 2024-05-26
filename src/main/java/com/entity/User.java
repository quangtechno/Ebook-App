package com.entity;

public class User {
  private int id;
  private String name;
  private String email;
  public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}

public String getProvince() {
	return province;
}
public void setProvince(String province) {
	this.province = province;
}

private String phone;
  private String password;	
  private String address;
  private String province;
  private String city;
  private String state;
  private String zip;
  
public User() {
	super();
	// TODO Auto-generated constructor stub
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getZip() {
	return zip;
}
public void setZip(String zip) {
	this.zip = zip;
}
@Override
public String toString() {
	return "User [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", password=" + password
			+ ", address=" + address + ", province=" + province + ", city=" + city + ", state=" + state + ", zip=" + zip
			+ "]";
}



  
}

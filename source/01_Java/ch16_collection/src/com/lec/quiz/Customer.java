package com.lec.quiz;
public class Customer {
	private String name;
	private String tel;
	private String address;
	public Customer() { }
	public Customer(String name, String tel, String address) {
		this.name = name;
		this.tel = tel;
		this.address = address;
	}
	@Override
	public String toString() {return name + "\t" + tel + "\t" + address;}
	@Override
	public int hashCode() {
		return toString().hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && getClass()==obj.getClass()) {
			Customer other = (Customer)obj;
			return name.equals(other.name) && tel.equals(other.tel) && address.equals(other.address);
		}
		return false;
	}
	public void setName(String name) {this.name = name;}
	public void setTel(String tel) {this.tel = tel;}
	public void setAddress(String address) {this.address = address;}
	public String getTel() {return tel;}
}

package com.lec.ex2_datastream;
public class Product {
	private String name;
	private int    price;
	private int    stock;
	public Product() {}
	public Product(String name, int price, int stock) {
		this.name = name;
		this.price = price;
		this.stock = stock;
	}
	@Override
	public String toString() {
		return name + "\t" + price + "¿ø\t" + stock + "°³";
	}
	public void setName(String name) {this.name = name;}
	public void setPrice(int price) {this.price = price;}
	public void setStock(int stock) {this.stock = stock;} 
}











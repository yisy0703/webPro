package com.lec.ex4_object;

public class Point3D implements Cloneable{
	private double x;
	private double y;
	private double z;
	public Point3D(){}
	public Point3D(double x, double y, double z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && getClass() == obj.getClass()){
			Point3D other = (Point3D) obj;
//			boolean xChk = (x == other.x);
//			boolean yChk = (y == other.y);
//			boolean zChk = (z == other.z);
//			return xChk && yChk && zChk;
			return x==other.x && y==other.y && z==other.z;
		}
		return false;
	}
	@Override
	public String toString() {
		return "ÁÂÇ¥°ª ["+x+", "+y+", "+z+"]";
	}
	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
	public void setX(double x) {this.x = x;}
	public void setY(double y) {this.y = y;}
	public void setZ(double z) {this.z = z;}
}

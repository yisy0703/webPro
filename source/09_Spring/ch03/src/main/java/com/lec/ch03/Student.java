package com.lec.ch03;
import java.util.ArrayList;
import lombok.Data;
@Data
public class Student {
	private String name;
	private int age;
	private ArrayList<String> hobbies;
	private double height;
	private double weight;
	public Student(String name, int age, ArrayList<String> hobbies) {
		this.name = name;
		this.age = age;
		this.hobbies = hobbies;
	}
}

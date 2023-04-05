package com.lec.ch06.ex1;
import lombok.Data;
@Data
public class Worker {
	private String name;
	private int age;
	private String job;
	public void getWorkerInfo() { // 호출될 핵심기능(joinPoint, 비즈니스로직=타겟메소드)
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("직책 : " + job);
	}
}

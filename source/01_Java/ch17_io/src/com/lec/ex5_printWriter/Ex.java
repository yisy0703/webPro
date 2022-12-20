package com.lec.ex5_printWriter;
import java.io.*;
public class Ex {
	public static void main(String[] args) {
		OutputStream os     = null;  // 기본스트림
		Writer       writer = null;  // 기본스트림
		PrintWriter  printWriter = null;
		try {
			// 1. PrintWriter : OutputStream의 보조스트림
			os = new FileOutputStream("txtFile/outTest.txt", true);
			printWriter = new PrintWriter(os);
			System.out.println("안녕하세요\n반갑습니다");
			printWriter.println("안녕하세요\n반갑습니다");
			System.out.print("print는 자동개행이 안되요. 그래서 개행추가\n");
			printWriter.print("print는 자동개행이 안되요. 그래서 개행추가\n");
			System.out.printf("%s %3d %3d %5.1f\n", "홍길동", 95, 94, 94.5);
			printWriter.printf("%s %3d %3d %5.1f\n", "홍길동", 95, 94, 94.5);
			System.out.printf("%s %3d %3d %5.1f\n", "신길동", 100, 99, 99.5);
			printWriter.printf("%s %3d %3d %5.1f\n", "신길동", 100, 99, 99.5);
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(printWriter!=null) printWriter.close();
				if(os!=null) os.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}

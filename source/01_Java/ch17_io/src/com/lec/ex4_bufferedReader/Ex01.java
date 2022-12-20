package com.lec.ex4_bufferedReader;
import java.io.*;
public class Ex01 {
	public static void main(String[] args) {
		Reader reader = null;
		BufferedReader br = null;
		try {
			reader = new FileReader("txtFile/inTest.txt"); // 1.스트림생성
			br = new BufferedReader(reader); // 보조스트림은 기본스트림을 통해
			while(true) {
				String linedata = br.readLine(); // 2. 한줄씩 읽는다
				if(linedata == null) break;
				System.out.println(linedata);
			}
			System.out.println("파일 입력 끝");
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(br!=null) br.close();
				if(reader!=null) reader.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}

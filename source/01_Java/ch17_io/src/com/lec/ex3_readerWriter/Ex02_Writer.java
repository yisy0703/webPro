package com.lec.ex3_readerWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
public class Ex02_Writer {
	public static void main(String[] args) {
		Writer writer = null;
		try {
			writer = new FileWriter("txtFile/outTest.txt");
//			char[] msg = {'안','녕','하','세','요'};
//			for(char m : msg) {
//				writer.write(m);
//			}
//			writer.write(msg);
			String msg = "안녕하세요, 자바\n추운 날씨 감기 조심하세요";
			writer.write(msg);
			String msg1 = "이번주 금요일에는 영하 15도까지 내려간대요\n 따뜻하게 입고 오세요";
			writer.write(msg1);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(writer!=null) writer.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}





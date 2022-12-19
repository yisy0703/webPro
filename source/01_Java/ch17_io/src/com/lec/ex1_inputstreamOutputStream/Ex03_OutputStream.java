package com.lec.ex1_inputstreamOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
// 파일을 연다->쓴다->파일을 닫는다
public class Ex03_OutputStream {
	public static void main(String[] args) {
		OutputStream os = null;
		try {
			os = new FileOutputStream("txtFile/outTest.txt", true);// true : append
			byte[] bs = {'H', 'e', 'l', 'l','o',' ', 'C','+','+'};
//			for(byte b : bs) {
//				os.write(b); // 2. 데이터 write한다
//			}
			os.write(bs);
			System.out.println("파일 출력 성공");
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
















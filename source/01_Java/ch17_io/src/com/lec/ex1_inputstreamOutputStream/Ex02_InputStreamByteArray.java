package com.lec.ex1_inputstreamOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
// (1) 파일을 연다(InputStream객체생성)
// (2) 데이터를 읽는다 : read() : 1byte씩 읽는다(속도느림).  read(byte[]) : byte배열의 length만큼 읽는다(속도빠름)
// (3) 파일을 닫는다
public class Ex02_InputStreamByteArray {
	public static void main(String[] args) {
		InputStream is = null;
		try {
			is = new FileInputStream("D:/webPro/source/01_Java/ch17_io/txtFile/inTest.txt"); // 1.파일을연다
			// 2. 데이터를 읽는다(10byte씩 반복적으로 읽는다)
			byte[] bs = new byte[10];
			while(true) {
				int readByteCount = is.read(bs);
				if(readByteCount == -1) break; // 파일의 끝인지 여부
				for(int i=0 ; i<readByteCount ; i++) {
					System.out.print((char)bs[i]);
				}
			}
			System.out.println("\nDone");
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}















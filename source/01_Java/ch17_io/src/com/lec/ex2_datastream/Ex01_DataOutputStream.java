package com.lec.ex2_datastream;
import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
// OutputStream를 보조(조금 발전된 스트림)
public class Ex01_DataOutputStream {
	public static void main(String[] args) {
		OutputStream     fos = null; // 기본 스트림
		DataOutputStream dos = null; // 보조 스트림
		try {
			fos = new FileOutputStream("txtFile/dataFile.dat", true);
			dos = new DataOutputStream(fos);
			dos.writeUTF("홍길동"); // 스트링 저장
			dos.writeInt(2); // int 저장
			dos.writeDouble(95.5); // double 값 저장
			
			dos.writeUTF("마길동"); // 스트링 저장
			dos.writeInt(6); // int 저장
			dos.writeDouble(97.2); // double 값 저장
			System.out.println("파일 저장 완료");
		} catch (FileNotFoundException e) {
			System.out.println("폴더를 못 찾음 : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("쓰기 예외 : " + e.getMessage());
		}finally {
			try {
				if(dos!=null) dos.close();
				if(fos!=null) fos.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}

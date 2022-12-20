package com.lec.ex1_inputstreamOutputStream;
import java.io.*;
// d:/webPro/note/bts.mp4 => d:/webPro/note/bts_copy.mp4( 8,075,033 byte )
public class Ex05_FileCopyStep2 {
	public static void main(String[] args) {
		long start = System.currentTimeMillis(); // 1970.1.1부터 시작시점까지의 밀리세컨
		InputStream is = null;
		OutputStream os = null;
		try {
			is = new FileInputStream("d:\\webPro\\note\\bts.mp4"); // 1. 스트림 객체 생성
			os = new FileOutputStream("d:/webPro/note/bts_copy.mp4");
			byte[] bs = new byte[1024]; // 1킬로바이트
			int cnt = 0;
			while(true) { // 7887 번쯤 수행
				cnt++;
				int count = is.read(bs); // 2. read(bs에 읽는다) & write : 
				if(count == -1) break;
				os.write(bs, 0, count); // bs배열을 0번 index부터 count 바이트 만큼 write
			}
			System.out.println(cnt + "번 while문 실행하여 복사 성공");
		} catch (FileNotFoundException e) {
			System.out.println("파일이나 폴더를 못 찾음"+e.getMessage());
		} catch (IOException e) {
			System.out.println("read & writer 오류 : " + e.getMessage());
		} finally {
			try {
				if(os!=null) os.close(); // 3.파일 닫기(스트림 해제)
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}//try-catch-finally
		long end = System.currentTimeMillis(); // 1970.1.1 ~ 끝나는 시점까지의 밀리세컨
		System.out.println(end-start);
	}//main
}










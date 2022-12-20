package com.lec.ex1_inputstreamOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
// JSP�� Spring���� ����÷�ΰԽ��� �ۼ��� copy�� ����
// d:/webPro/note/bts.mp4 => d:/webPro/note/bts_copy.mp4( 8,075,033 byte )
public class Ex05_FileCopyStep3 {
	public static void main(String[] args) {
		long start = System.currentTimeMillis(); // 1970.1.1���� ���۽��������� �и�����
		InputStream is = null;
		OutputStream os = null;
		try {
			File file = new File("d:\\webPro\\note\\bts.mp4");
			is = new FileInputStream(file); // 1. ��Ʈ�� ��ü ����
			os = new FileOutputStream("d:/webPro/note/bts_copy.mp4");
			byte[] bs = new byte[(int)file.length()]; // 1ų�ι���Ʈ
			int cnt = 0;
			while(true) { // 2 �� ����
				cnt++;
				int count = is.read(bs); // 2. read(bs�� �д´�) & write : 
				if(count == -1) break;
				os.write(bs, 0, count); // bs�迭�� 0�� index���� count ����Ʈ ��ŭ write
			}
			System.out.println(cnt + "�� while�� �����Ͽ� ���� ����");
		} catch (FileNotFoundException e) {
			System.out.println("�����̳� ������ �� ã��"+e.getMessage());
		} catch (IOException e) {
			System.out.println("read & writer ���� : " + e.getMessage());
		} finally {
			try {
				if(os!=null) os.close(); // 3.���� �ݱ�(��Ʈ�� ����)
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}//try-catch-finally
		long end = System.currentTimeMillis(); // 1970.1.1 ~ ������ ���������� �и�����
		System.out.println(end-start);
	}//main
}










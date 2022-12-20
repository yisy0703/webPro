package com.lec.ex2_datastream;
import java.io.*;
import java.util.Scanner;
// x를 입력할때까지 재고등록(물건명, 가격, 재고수량):file출력 -> x를 입력하면 등록된 모든 재고 목록을 출력 
public class Ex03_Product {
	public static void main(String[] args) {
		// x를 입력할때까지 재고등록(물건명, 가격, 재고수량):file출력
		OutputStream     fos = null;
		DataOutputStream dos = null;
		Scanner scanner = new Scanner(System.in);
		try {
			fos = new FileOutputStream("src/com/lec/ex2_datastream/product.dat");
			dos = new DataOutputStream(fos);
			while(true) {
				System.out.print("입고된 재고가 더 있나요(입력:Y/종료:X) : ");
				if(scanner.next().trim().equals("x")) break;
				System.out.print("입고된 상품명 : ");
				dos.writeUTF(scanner.next());
				System.out.print("입고된 상품 가격 : ");
				dos.writeInt(scanner.nextInt());
				System.out.print("입고된 상품 재고량 : ");
				int stock = scanner.nextInt();
				dos.writeInt(stock);
			}
			System.out.println("재고 등록 완료");
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(dos!=null) dos.close();
				if(fos!=null) fos.close();
			} catch (IOException e) { 
				
			}// close
		}// 재고 등록 try-catch-finally
		// x를 입력하면 등록된 모든 재고 목록을 출력
		
	}
}











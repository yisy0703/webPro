package com.lec.ex2_datastream;
import java.io.*;
import java.util.Scanner;
// x�� �Է��Ҷ����� �����(���Ǹ�, ����, ������):file��� -> x�� �Է��ϸ� ��ϵ� ��� ��� ����� ��� 
public class Ex03_Product {
	public static void main(String[] args) {
		// x�� �Է��Ҷ����� �����(���Ǹ�, ����, ������):file���
		OutputStream     fos = null;
		DataOutputStream dos = null;
		Scanner scanner = new Scanner(System.in);
		try {
			fos = new FileOutputStream("src/com/lec/ex2_datastream/product.dat");
			dos = new DataOutputStream(fos);
			while(true) {
				System.out.print("�԰�� ��� �� �ֳ���(�Է�:Y/����:X) : ");
				if(scanner.next().trim().equals("x")) break;
				System.out.print("�԰�� ��ǰ�� : ");
				dos.writeUTF(scanner.next());
				System.out.print("�԰�� ��ǰ ���� : ");
				dos.writeInt(scanner.nextInt());
				System.out.print("�԰�� ��ǰ ��� : ");
				int stock = scanner.nextInt();
				dos.writeInt(stock);
			}
			System.out.println("��� ��� �Ϸ�");
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
		}// ��� ��� try-catch-finally
		// x�� �Է��ϸ� ��ϵ� ��� ��� ����� ���
		
	}
}











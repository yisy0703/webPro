package com.lec.ex2_date;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
public class Sawon {
	public static final String COMPUTER 	  = "COMPUTER";
	public static final String PLANNING       = "PLANNING";
	public static final String DESIGN         = "DESIGN";
	public static final String ACCOUNTING     = "ACCOUNTING";
	public static final String HUMANRESOURCES = "HUMANRESOURCES";
	private String no;       // ���
	private String name;     // �̸�
	private String dept;     // �μ�
	private Date hiredate;   // �Ի���
	public Sawon(String no, String name, String dept) {
		this.no = no;
		this.name = name;
		this.dept = dept;
		hiredate = new Date();
	}
	public Sawon(String no, String name, String dept, int y, int m, int d) {
		this.no   = no;
		this.name = name;
		this.dept = dept;
		// Ư���� y�� m�� d�Ϸ� �ʱ�ȭ
		// hiredate = new Date(y-1900, m-1, d);
		hiredate = new Date(new GregorianCalendar(y, m-1, d).getTimeInMillis()); 
	}
	@Override
	public String toString() {  // [���]a01  [�̸�]ȫ�浿    [�μ�]COMPUTER   [�Ի���]2022��3��31��(��)
		SimpleDateFormat sdf = new SimpleDateFormat("yy��M��d��(E)");
		if(dept.length() >8 )
			return "[���]=" + no + "\t[�̸�]" + name + "\t[�μ�]" + dept + "\t[�Ի���]" + sdf.format(hiredate);
		else
			return "[���]=" + no + "\t[�̸�]" + name + "\t[�μ�]" + dept + "\t\t[�Ի���]" + sdf.format(hiredate);
	}
}













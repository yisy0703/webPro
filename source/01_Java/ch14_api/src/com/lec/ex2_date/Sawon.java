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
	private String no;       // 사번
	private String name;     // 이름
	private String dept;     // 부서
	private Date hiredate;   // 입사일
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
		// 특정한 y년 m월 d일로 초기화
		// hiredate = new Date(y-1900, m-1, d);
		hiredate = new Date(new GregorianCalendar(y, m-1, d).getTimeInMillis()); 
	}
	@Override
	public String toString() {  // [사번]a01  [이름]홍길동    [부서]COMPUTER   [입사일]2022년3월31일(목)
		SimpleDateFormat sdf = new SimpleDateFormat("yy년M월d일(E)");
		if(dept.length() >8 )
			return "[사번]=" + no + "\t[이름]" + name + "\t[부서]" + dept + "\t[입사일]" + sdf.format(hiredate);
		else
			return "[사번]=" + no + "\t[이름]" + name + "\t[부서]" + dept + "\t\t[입사일]" + sdf.format(hiredate);
	}
}












